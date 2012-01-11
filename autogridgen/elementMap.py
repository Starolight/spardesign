import numpy as np
import VABSobjects as vo
import matplotlib.pyplot as plt


### generate a map of node numbers for each element, formatted as a 2D grid of integers
###		input: number_of_rows <int>, number of element (cell) rows in the grid
###		       number_of_columns <int>, number of element (cell) columns in the grid
###		       number_of_nodes <int>, total number of nodes (vertices) in the grid
###		       element <object>, list of EMPTY element objects
###		       unique_node <object>, list of unique node objects
###		output: element <object>, list of UPDATED (FILLED) element objects (assigned nodes and coordinates)
###		        nodeMap <np.array>, 2D array of integers, mapping the node numbers to their position in the grid
###		        elementMap <np.array>, 2D array of integers, mapping the element numbers to their position in the grid
def genElementMap(number_of_rows,number_of_columns,number_of_nodes,element,unique_node,debugflag=False):
	### internal variables in this function ###
	# nodeList = list of node numbers
	# reshapedList = reshaped list of node numbers that has the same shape as the 2D grid
	# nodeMap = 2D array of node numbers, arranged in the order of the 2D grid generated by the cartGrid methods

	# for example:
	# if number_of_nodes = 10, number_of_rows = 1, number_of_columns = 4
	#
	# nodeList     = [ 1  2  3  4  5  6  7  8  9 10]
	#
	# reshapedList = [[ 1  3  5  7  9]
 	#                 [ 2  4  6  8 10]]
 	#
	# nodeMap      = [[ 2  4  6  8 10]
 	#                [ 1  3  5  7  9]]

 	### sanity check the inputs for errors ###
 	sanityflag = ( number_of_nodes == ((number_of_rows+1)*(number_of_columns+1)) )
 	if (not sanityflag):
 		print "WARNING in elementMap.genElementMap: number_of_nodes != ((number_of_rows+1)*(number_of_columns+1))"

	nodeList = np.array( range(1, number_of_nodes+1) )
	reshapedList = np.reshape(nodeList, (number_of_rows+1, number_of_columns+1), order='F')
	nodeMap = reshapedList[ ::-1,:]  # equivalent to MATLAB's "flipud" function

	if (debugflag):
		print "node list:"
		print nodeList, "\n"
		print "node map:"
		print nodeMap, "\n"

	s = nodeMap.shape
	elementMap = np.empty((s[0]-1,s[1]-1), dtype=int)

	n = 1  # initialize counter for element number
	for row in range(number_of_rows):
		for col in range(number_of_columns):
			element[n].elem_no = n
			elementMap[row,col] = n
			(node1_no, node2_no, node3_no, node4_no) = (nodeMap[row+1,col], nodeMap[row+1,col+1], nodeMap[row,col+1], nodeMap[row,col])
			(element[n].node1, element[n].node2, element[n].node3, element[n].node4) = (unique_node[node1_no], unique_node[node2_no], unique_node[node3_no], unique_node[node4_no])
			n = n+1
	
	if (debugflag):
		print "element map:"
		print elementMap, "\n"

	return (element,nodeMap,elementMap)


### extract the edges of an element map
###		input: elementMap <np.array>, 2D array of integers, mapping the node numbers to their position in the grid for each element
###		output: left <np.array>, 1D array of integers, mapping the node numbers of the grid's left edge
###		        right <np.array>, 1D array of integers, mapping the node numbers of the grid's right edge
###		        top <np.array>, 1D array of integers, mapping the node numbers of the grid's top edge
###		        bottom <np.array>, 1D array of integers, mapping the node numbers of the grid's bottom edge
def extractEdges(elementMap):
	left   = elementMap[:,0]
	right  = elementMap[:,-1]
	top    = elementMap[0,:]
	bottom = elementMap[-1,:]
	return (left,right,top,bottom)


### use matplotlib to draw vertical lines (from the top edge to the bottom edge of the grid) to draw the grid
### 	and horizontal lines (from the left edge to the right edge of the grid)
### 	more efficiently than drawing each side of each element in the grid
### 	***DEPRECATED*** use gridViz.plotRectGrid (with mayavi) ... it's much faster
###
###		input: elementMap <np.array>, 2D array of integers, mapping the node numbers to their position in the grid for each element
###		       unique_node <object>, list of unique node objects
###		output: matplotlib plot of the grid (on the screen)
def plotGridLines(elementMap,unique_node):
	(left,right,top,bottom) = extractEdges(elementMap)

	## vertical lines ##
	for i in range(len(top)):
		# x = np.array([unique_node[top[i]].x2, unique_node[bottom[i]].x2])
		# y = np.array([unique_node[top[i]].x3, unique_node[bottom[i]].x3])
		# plt.plot(x,y,'k-')
		plt.plot(np.array([unique_node[top[i]].x2, unique_node[bottom[i]].x2]), np.array([unique_node[top[i]].x3, unique_node[bottom[i]].x3]), 'k-')

		if i % 100 == 0:  # print progress to screen
			print '          drawing VERTICAL line #' + str(i) + '/' + str(len(top))

	## horizontal lines ##
	for i in range(len(left)):
		# x = np.array([unique_node[left[i]].x2, unique_node[right[i]].x2])
		# y = np.array([unique_node[left[i]].x3, unique_node[right[i]].x3])
		# plt.plot(x,y,'k-')
		plt.plot(np.array([unique_node[left[i]].x2, unique_node[right[i]].x2]), np.array([unique_node[left[i]].x3, unique_node[right[i]].x3]), 'k-')

		if i % 100 == 0:  # print progress to screen
			print '          drawing HORIZONTAL line #' + str(i) + '/' + str(len(left))
	
	return

### get the x&y coordinates required by tvtk.RectilinearGrid() in mayavi
###		input: elementMap <np.array>, 2D array of integers, mapping the node numbers to their position in the grid for each element
###		       unique_node <object>, list of unique node objects
###		output: x_coords <np.array>, array of x-coordinates for tvtk.RectilinearGrid().x_coordinates in mayavi
###		        y_coords <np.array>, array of y-coordinates for tvtk.RectilinearGrid().y_coordinates in mayavi
def getRectGridCoords(elementMap,unique_node):
	(left,right,top,bottom) = extractEdges(elementMap)

	## horizontal (top) edge / x-coordinates ##
	x_coords = np.empty(top.shape)  # make a new array with the same shape as the array "top"
	for i in range(len(top)):
		x_coords[i] = unique_node[top[i]].x2
	
	## vertical (left) edge / y-coordinates ##
	y_coords = np.empty(left.shape) # make a new array with the same shape as the array "left"
	for i in range(len(left)):
		y_coords[i] = unique_node[left[i]].x3

	return (x_coords,y_coords)



if __name__ == '__main__':   # if run, not imported
	## initialize number of rows and columns ##
	nrows = 3  # number of element rows
	ncols = 2  # number of element columns

	## calculate the number of elements and nodes for this region ##
	num_elements = nrows * ncols
	num_nodes = (nrows+1) * (ncols+1)

	## initialize objects for the VABSobjects module ##
	unique_node = []  # create an empty list of node objects
	element = []      # create an empty list of element objects

	## call functions from the VABSobjects module ##
	vo.fillNodeObjects(num_nodes, unique_node)
	vo.fillElementObjects(num_elements, element)

	## fill list of node objects ##
	for i in range(1,num_nodes+1):
		unique_node[i].node_no = i
		(unique_node[i].x2, unique_node[i].x3) = (0.0, 0.0)
# 	# (unique_node[1].x2, unique_node[1].x3) = (0.0, 0.0)
# 	# (unique_node[2].x2, unique_node[2].x3) = (0.0, 1.0)
# 	# (unique_node[3].x2, unique_node[3].x3) = (1.0, 0.0)
# 	# (unique_node[4].x2, unique_node[4].x3) = (1.0, 1.0)

	## generate the element map, and store it in the list of element objects ##
	(element,nMap,eMap) = genElementMap(nrows,ncols,num_nodes,element,unique_node,True)

# 	## check if the function correctly assigned the element connectivity ##
# 	for i in range(1,num_elements+1):
# 		print element[i].node1.node_no, element[i].node2.node_no, element[i].node3.node_no, element[i].node4.node_no
	
# 	# print element[1].node1.x2, element[1].node1.x3

# 	(left,right,top,bottom) = extractEdges(eMap)
# 	print left, right, top, bottom

# 	extractGridLines(left,right,top,bottom,unique_node)