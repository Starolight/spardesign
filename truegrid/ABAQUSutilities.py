import re                        # import the regular expression module
import os                        # import the operating system module
import numpy as np               # import the the numpy module; rename it as np


## read the ABAQUS-formatted file from TrueGrid into memory
##    input: filestr <string>, the filename of the ABAQUS-formatted file
##    output: abqfile <string>, a string of all characters in the ABAQUS-formatted file
def readFile(filestr):
    f = open(filestr, 'r')  # read the file
    abqfile = f.readlines()    # parse all characters in file into one long string
    return abqfile


## make temporary files on hard disk to store nodes and element connectivity parsed from the ABAQUS-formatted file from TrueGrid
##    input: <none>
##    output: nodeFile <object>, file handle to node.txt
##            elemFile <object>, file handle to elem.txt
##            esetFile <object>, file handle to eset.txt
def makeTempFiles():
    nodeFile = open('node.txt', 'w+')  # file for node coordinates
    elemFile = open('elem.txt', 'w+')  # file for element connectivity
    esetFile = open('eset.txt', 'w+')  # file for element sets (for each structural component)
    return (nodeFile, elemFile, esetFile)


## define regular expressions to search for nodes and elements in ABAQUS-formatted file
##    input: <none>
##    output: nodePat <object>, regex pattern for a node
##            elemPat <object>, regex pattern for an element connectivity
def defineRegularExpressions():
    # node pattern:
    nodePat = re.compile(r'[0-9]+(,-*[0-9]+\.[0-9]*E*[+-]*[0-9]*){3}')
    #  this regex pattern explained:
    #  -----------------------------
    #  [0-9]+                               :  node number
    #  (,-*[0-9]+\.[0-9]*E*[+-]*[0-9]*){3}  :  x-coord, y-coord, z-coord triad (may be in decimal or scientific notation)

    # node header pattern:
    nodeHeadPat = re.compile(r'\*NODE.+')
    
    # shell header pattern:
    # shellHeadPat = re.compile(r'\*SHELL.+')

    # element connectivity pattern:
    # elemPat = re.compile(r'[0-9]+,[0-9]+,[0-9]+,[0-9]+,[0-9]+,[0-9]+,[0-9]+,[0-9]+,[0-9]+')
    elemPat = re.compile(r'[0-9]+(,[0-9]+){4,8}')
    #  this regex pattern explained:
    #  -----------------------------
    #  [0-9]+          :  element number
    #  (,[0-9]+){4,8}  :  node1-node4 or node1-node8

    # element header pattern:
    elemHeadPat = re.compile(r'\*MATERIAL,NAME=M[0-9]+')

    # element set pattern:
    # esetPat = re.compile(r'([0-9]+,){5,16}')

    # element set header pattern:
    esetHeadPat = re.compile(r'\*ELSET,ELSET=.+')

    # generic header pattern:
    # headPat = re.compile(r'\*.+')
    
    return (nodePat, elemPat, nodeHeadPat, elemHeadPat, esetHeadPat)


## find the headers in the ABAQUS-formatted file, and return their line numbers
def findHeaders(headPat, abqfile):
    headLineNums = []
    for i in range(len(abqfile)):
        headMatch = headPat.match(abqfile[i])
        if headMatch:
            headLineNums.append(i)
    
    return headLineNums


## find the start of the node block, element connectivity block, and element set blocks
def findBlockStarts(nodeHeadPat, elemHeadPat, esetHeadPat, abqfile):
    nodeHead_lines = []
    elemHead_lines = []
    esetHead_lines = []
    for i in range(len(abqfile)):
        nodeHeadMatch = nodeHeadPat.match(abqfile[i])
        elemHeadMatch = elemHeadPat.match(abqfile[i])
        esetHeadMatch = esetHeadPat.match(abqfile[i])
        if nodeHeadMatch:
            nodeHead_lines.append(i)
        elif elemHeadMatch:
            elemHead_lines.append(i)
        elif esetHeadMatch:
            esetHead_lines.append(i)
    (nodeBlockStart, elemBlockStart, esetBlockStart) = (nodeHead_lines[0], elemHead_lines[0], esetHead_lines[0])
    
    return (nodeBlockStart, elemBlockStart, esetBlockStart)


## interpret readlines() string from ABAQUS file
##    parse nodes and element connectivity into numpy arrays
##    input: abqfile <string>, a string of all characters in the ABAQUS-formatted file
##           nodeFile <object>, file handle to node.txt
##           elemFile <object>, file handle to elem.txt
##    output: coordinates <array>, a numpy array of x&y coordinates for each node
##            connectivity <array>, a numpy array of node numbers describing the connectivity of each element
##            nnode <int>, the total number of nodes in this grid
##            nelem <int>, the total number of elements (cells) in this grid
def interpretABAQUS(abqfile, nodeFile, elemFile, esetFile, debug_flag=False):
    # define the regular expression patterns
    (nodePat, elemPat, nodeHeadPat, elemHeadPat, esetHeadPat) = defineRegularExpressions()

    # # get line numbers of headers
    # headLineNums = findHeaders(headPat, abqfile)
    # if debug_flag:
    #     print "headers found on lines: ", headLineNums
    #     for i in range(len(headLineNums)):
    #         print abqfile[headLineNums[i]]

    # find the line numbers on which the node block, element connectivity block, and element set blocks start
    (nodeBlockStart, elemBlockStart, esetBlockStart) = findBlockStarts(nodeHeadPat, elemHeadPat, esetHeadPat, abqfile)
    if debug_flag:
        print (nodeBlockStart, elemBlockStart, esetBlockStart)
        print abqfile[nodeBlockStart]
        print abqfile[elemBlockStart]
        print abqfile[esetBlockStart]

    for i in range(nodeBlockStart,elemBlockStart):
        nodeMatch = nodePat.match(abqfile[i])
        if nodeMatch:  # if we find a node, write it to node.txt
            nodeFile.write(abqfile[i])

    for i in range(elemBlockStart,esetBlockStart):
        elemMatch = elemPat.match(abqfile[i])
        elemHeadMatch = elemHeadPat.match(abqfile[i])
        if elemHeadMatch:
            layer_no = int(abqfile[i][-2])
            if debug_flag:
                print 'element header found at line ' + str(i)
                print 'layer #' + str(layer_no)
                print 'first element: #' + str(np.fromstring(abqfile[i+6], dtype=int, sep=',')[0]) + '\n'
        elif elemMatch:  # if we find an element connectivity, write it to elem.txt
            elemFile.write(str(layer_no) + ',' + abqfile[i]) # store the layer number of each element at the beginning of each line in elem.txt

    # this dictionary defines the relationship between element set names and their theta1 values
    # e.g., the element set named 'scb' (bottom spar cap) has theta1=180 degrees
    theta1_dict = { 'swlbiaxl': 90,      # left wall
                    'swlfoam':  90,      # left wall
                    'swlbiaxr': 90,      # left wall
                    'swrbiaxl': 270,     # right wall
                    'swrfoam':  270,     # right wall
                    'swrbiaxr': 270,     # right wall
                    'sct':      0,       # top wall
                    'rbt':      0,       # top wall
                    'scb':      180,     # bottom wall
                    'rbb':      180 }    # bottom wall

    for i in range(esetBlockStart,len(abqfile)):
        esetHeadMatch = esetHeadPat.match(abqfile[i])
        if esetHeadMatch:
            theta1 = theta1_dict[abqfile[i][13:-1]]
            if debug_flag:
                print 'element set: ' + abqfile[i][13:-1]
                print 'theta1 = ' + str(theta1) + '\n'
        else:
            esetLine = np.fromstring(abqfile[i], dtype=int, sep=',')
            for j in range(len(esetLine)-1):
                esetFile.write(str(theta1) + ',' + str(esetLine[j]) + '\n')  # store the theta1 value of each element at the beg. of each line in eset.txt
        

    # for i in range(len(abqfile)):
    #     # search for (x,y,z) coordinates:
    #     nodeMatch = nodePat.match(abqfile[i])
    #     elemMatch = elemPat.match(abqfile[i])
    #     elemHeadMatch = elemHeadPat.match(abqfile[i])
    #     if nodeMatch:  # if we find a node, write it to node.txt
    #         nodeFile.write(abqfile[i])
    #     elif elemHeadMatch:
    #         layer_no = int(abqfile[i][-2])
    #         if debug_flag:
    #             print 'element header found at line ' + str(i)
    #             print 'layer #' + str(layer_no)
    #             print 'first element: #' + str(np.fromstring(abqfile[i+6], dtype=int, sep=',')[0]) + '\n'
    #     elif elemMatch:  # if we find an element connectivity, write it to elem.txt
    #         elemFile.write(str(layer_no) + ',' + abqfile[i]) # store the layer number of each element at the beginning of each line in elem.txt

    # rewind cursor to beginning of file 'node.txt'
    nodeFile.seek(0,0)
    # load nodes into an array
    nodeArray = np.loadtxt('node.txt', delimiter=',', usecols=(0,1,2))
    #   usecols kwarg discards the last column, which only contains zeros (z-coords)

    # rewind cursor to beginning of file 'elem.txt'
    elemFile.seek(0,0)
    # load element connectivity into an array (of integers)
    elemArray = np.loadtxt('elem.txt', dtype='int', delimiter=',')
    # sort the array by element number
    elemArray = elemArray[elemArray[:,1].argsort()]

    # rewind cursor to beginning of file 'elem.txt'
    esetFile.seek(0,0)
    # load element connectivity into an array (of integers)
    esetArray = np.loadtxt('eset.txt', dtype='int', delimiter=',')
    # sort the array by element number
    esetArray = esetArray[esetArray[:,1].argsort()]

    nnode = len(nodeArray)  # set the number of nodes
    nelem = len(elemArray)  # set the number of elements

    checkABAQUSparsing(nodeArray, nnode)
    # may need to check parsing of eset.txt ... I think some elements are missing!

    return (nodeArray, elemArray, esetArray, nnode, nelem)



def checkABAQUSparsing(nodeArray, nnode):
    lastnodeno = int(nodeArray[-1,0])
    if lastnodeno != nnode:
        print '***ERROR: number of nodes does not equal the last node number in the list***'
        print '     number_of_nodes = ' + str(nnode)
        print '     last node number: ' + str(lastnodeno)

    return


## close files on hard disk that store nodes and element connectivity
##    input: nodeFile <object>, file handle to node.txt
##           elemFile <object>, file handle to elem.txt
##    output: <none>
def closeTempFiles(nodeFile, elemFile, esetFile):
    nodeFile.close()
    elemFile.close()
    esetFile.close()
    return


## delete the files on hard disk that store coordinates and connectivity
##    input: <none>
##    output: <none>
def deleteTempFiles():
    os.remove('node.txt')
    os.remove('elem.txt')
    os.remove('eset.txt')
    return


## parse the ABAQUS file and return numpy arrays with the nodes and element connectivity
##    also return the number of nodes and the number of elements
##    input: filestr <string>, the filename of the ABAQUS-formatted file
##    output: nodeArray <np.array>, array of nodes and coordinates
##            elemArray <np.array>, array of elements and connectivity
##            nnode <int>, number of nodes
##            nelem <int>, number of elements
def parseABAQUS(filestr, debug_flag=False):
    if debug_flag:
        print 'ABAQUS file: ' + filestr
    abqfile = readFile(filestr)
    (nodeFile, elemFile, esetFile) = makeTempFiles()
    if debug_flag:
        print 'STATUS: interpreting the ABAQUS file...'
    (nodeArray, elemArray, esetArray, nnode, nelem) = interpretABAQUS(abqfile, nodeFile, elemFile, esetFile, debug_flag=debug_flag)
    closeTempFiles(nodeFile, elemFile, esetFile)
    deleteTempFiles()
    if debug_flag:
        print nodeArray[0:5,:]
        print elemArray[0:5,:]
        print esetArray[0:5,:]
        print 'number of nodes: ' + str(nnode)
        print 'number of elements: ' + str(nelem)

    return (nodeArray, elemArray, esetArray, nnode, nelem)





if __name__ == '__main__':
    outputfile = 'spar_station_04_output.txt'
    (nodeArray, elemArray, esetArray, nnode, nelem) = parseABAQUS(outputfile, debug_flag=True)