import time

# record the time when the code starts
start_time = time.time()

import autogridgen.genGrid as gg
import autogridgen.VABSobjects as vo
import autogridgen.read_layup as rl
import autogridgen.triQuadGrid as tqg
import os
import numpy as np
import autogridgen.cartGrid as cg
import autogridgen.gridViz as gv

fastflag = True
plot_flag = True
main_debug_flag = True
runVABS_flag = True
zoom_flag = False
gridlines_flag = True
spar_stn = 22   # run the 23rd spar station
maxAR = 7.3  # according to PreVABS, the cell aspect ratio is usually set from 3.0-8.0 ... maybe 1.2 is too small (high mem usage!)
vabs_filename = 'cs_input_file.dat'


# set the number of materials
#   4 materials used: uniaxial, biaxial, triaxial GFRP, and foam
number_of_materials = 4

# set the number of layers
#   7 layers used:  layer_no  material    theta3 (layup angle)
#                   --------  ----------  --------------------
#                       1     1 (uniax)          0 deg
#                       2     2 (biax)         +45 deg
#                       3     2 (biax)         -45 deg
#                       4     3 (triax)        +45 deg
#                       5     3 (triax)        -45 deg
#                       6     3 (triax)          0 deg
#                       7     4 (foam)           0 deg
number_of_layers = 7


# create VABS objects for materials and layups
print "STATUS: create VABS materials and layups..."

layer = []        # create an empty list of layer objects
material = []     # create an empty list of material objects

vo.fillLayerObjects(number_of_layers, layer)
vo.fillMaterialObjects(number_of_materials, material)
vo.assignMaterials(number_of_materials, material)
vo.assignLayers(layer, material)


################################################################################################################################################
# create VABS objects for nodes and elements for the entire cross-section ############################################################################################
print "STATUS: create VABS nodes and elements for the ENTIRE CROSS-SECTION..."

node = []
element = []
region = []
number_of_nodes = 0
number_of_elements = 0
number_of_regions = 0

## set number of plies for each structural component ##
SC_plies = 2       # spar cap has 2 plies:                      [0]_2
RB_plies = 6       # root buildup has 6 plies:                  [+/-45]_2 [0]_2
SW_biax_plies = 8  # biaxial laminate in shear web has 8 plies: [+/-45]_4
SW_foam_plies = 8  # set the foam part of the shear web to some arbitrary number (the foam doesn't really have plies)

# fill index 0 of node, element, and region lists (index 0 is unused)
(node, element, region) = tqg.fillUnusedZeroIndex(node, element, region)

# fill in 4 regions
total_regions = 8
for i in range(1,total_regions+1):
    (number_of_regions, region) = tqg.createNewRegion(number_of_regions, region)

# name regions
region[1].name = 'left shear web, left biax laminate'
region[2].name = 'left shear web, foam core'
region[3].name = 'left shear web, right biax laminate'
region[4].name = 'right shear web, left biax laminate'
region[5].name = 'right shear web, foam core'
region[6].name = 'right shear web, right biax laminate'
region[7].name = 'bottom spar cap'
region[8].name = 'top spar cap'

# make a dictionary mapping region.name entries to region.region_no entries
rDict = {}
for i in range(1,total_regions+1):
    rDict[region[i].name] = region[i].region_no

# import the data from the layup file
data = rl.readLayupFile('autogridgen/monoplane_spar_layup.txt')
SW_corners = rl.extract_SW_corners(data,spar_stn)
SC_corners = rl.extract_SC_corners(data,spar_stn)

################################################################################################################################################
# fill in nodes at region corners
total_cornerNodes = 16
for i in range(1,total_cornerNodes+1):
    (number_of_nodes, node) = tqg.createNewNode(number_of_nodes, node)


## left shear web ###########################################################  SW_corners[0,:,:,:]
# left biax laminate #  SW_corners[0,0,:,:]
(node[1].x2, node[1].x3) = (SW_corners[0,0,2,0], SW_corners[0,0,2,1])
(node[2].x2, node[2].x3) = (SW_corners[0,0,3,0], SW_corners[0,0,3,1])
(node[3].x2, node[3].x3) = (SW_corners[0,0,1,0], SW_corners[0,0,1,1])
(node[4].x2, node[4].x3) = (SW_corners[0,0,0,0], SW_corners[0,0,0,1])

# right biax laminate #  SW_corners[0,2,:,:]
(node[5].x2, node[5].x3) = (SW_corners[0,2,2,0], SW_corners[0,2,2,1])
(node[6].x2, node[6].x3) = (SW_corners[0,2,3,0], SW_corners[0,2,3,1])  # this is also cornerNode1 (bottom left corner) for the bottom spar cap (region[7])
(node[7].x2, node[7].x3) = (SW_corners[0,2,1,0], SW_corners[0,2,1,1])  # this is also cornerNode4 (top left corner) for the top spar cap (region[8])
(node[8].x2, node[8].x3) = (SW_corners[0,2,0,0], SW_corners[0,2,0,1])

## right shear web ###########################################################  SW_corners[1,:,:,:]
# left biax laminate #  SW_corners[1,0,:,:]
(node[9].x2,  node[9].x3)  = (SW_corners[1,0,2,0], SW_corners[1,0,2,1])  # this is also cornerNode2 (bottom left corner) for the bottom spar cap (region[7])
(node[10].x2, node[10].x3) = (SW_corners[1,0,3,0], SW_corners[1,0,3,1])
(node[11].x2, node[11].x3) = (SW_corners[1,0,1,0], SW_corners[1,0,1,1])
(node[12].x2, node[12].x3) = (SW_corners[1,0,0,0], SW_corners[1,0,0,1])  # this is also cornerNode3 (top right corner) for the top spar cap (region[8])

# right biax laminate #  SW_corners[1,2,:,:]
(node[13].x2, node[13].x3) = (SW_corners[1,2,2,0], SW_corners[1,2,2,1])
(node[14].x2, node[14].x3) = (SW_corners[1,2,3,0], SW_corners[1,2,3,1])
(node[15].x2, node[15].x3) = (SW_corners[1,2,1,0], SW_corners[1,2,1,1])
(node[16].x2, node[16].x3) = (SW_corners[1,2,0,0], SW_corners[1,2,0,1])


# *regions*
# -cornerNodes-
#
# 04--03------08--07------------------------------12--11------16--15
# |~~~~|......|~~~~|+++++++++++++*8*++++++++++++++|~~~~|......|~~~~|
# |~~~~|......|~~~20------------------------------19~~~|......|~~~~|
# |~~~~|......|~~~~|                              |~~~~|......|~~~~|
# |~~~~|......|~~~~|                              |~~~~|......|~~~~|
# |~~~~|......|~~~~|                              |~~~~|......|~~~~|
# |*1*~|.*2*..|*3*~|                              |*4*~|.*5*..|*6*~|
# |~~~~|......|~~~~|                              |~~~~|......|~~~~|
# |~~~~|......|~~~~|                              |~~~~|......|~~~~|
# |~~~~|......|~~~~|                              |~~~~|......|~~~~|
# |~~~~|......|~~~17------------------------------18~~~|......|~~~~|
# |~~~~|......|~~~~|+++++++++++++*7*++++++++++++++|~~~~|......|~~~~|
# 01--02------05--06------------------------------09--10------13--14






################################################################################################################################################
# assign corner nodes to each region
(region[rDict['left shear web, left biax laminate']].cornerNode1,
 region[rDict['left shear web, left biax laminate']].cornerNode2,
 region[rDict['left shear web, left biax laminate']].cornerNode3,
 region[rDict['left shear web, left biax laminate']].cornerNode4) = (node[1], node[2], node[3], node[4])
(region[rDict['left shear web, foam core']].cornerNode1,
 region[rDict['left shear web, foam core']].cornerNode2,
 region[rDict['left shear web, foam core']].cornerNode3,
 region[rDict['left shear web, foam core']].cornerNode4) = (node[2], node[5], node[8], node[3])
(region[rDict['left shear web, right biax laminate']].cornerNode1,
 region[rDict['left shear web, right biax laminate']].cornerNode2,
 region[rDict['left shear web, right biax laminate']].cornerNode3,
 region[rDict['left shear web, right biax laminate']].cornerNode4) = (node[5], node[6], node[7], node[8])
(region[rDict['right shear web, left biax laminate']].cornerNode1,
 region[rDict['right shear web, left biax laminate']].cornerNode2,
 region[rDict['right shear web, left biax laminate']].cornerNode3,
 region[rDict['right shear web, left biax laminate']].cornerNode4) = (node[9], node[10], node[11], node[12])
(region[rDict['right shear web, foam core']].cornerNode1,
 region[rDict['right shear web, foam core']].cornerNode2,
 region[rDict['right shear web, foam core']].cornerNode3,
 region[rDict['right shear web, foam core']].cornerNode4) = (node[10], node[13], node[16], node[11])
(region[rDict['right shear web, right biax laminate']].cornerNode1,
 region[rDict['right shear web, right biax laminate']].cornerNode2,
 region[rDict['right shear web, right biax laminate']].cornerNode3,
 region[rDict['right shear web, right biax laminate']].cornerNode4) = (node[13], node[14], node[15], node[16])
(region[rDict['bottom spar cap']].cornerNode1,
 region[rDict['bottom spar cap']].cornerNode2) = (node[6], node[9])  # cornerNode3 and cornerNode4 will be assigned later
(region[rDict['top spar cap']].cornerNode3,
 region[rDict['top spar cap']].cornerNode4) = (node[12], node[7])  # cornerNode1 and cornerNode2 will be assigned later





################################################################################################################################################
# assign number of cells distributed along horizontal and vertical axes
# left shear web, left biax laminate ############## SW_corners[0,0,:,:]
(dimH,dimV) = cg.calcCornerDims(SW_corners[0,0,:,:])
(nH,nV) = cg.calcCellNums(dimH,SW_biax_plies,maxAR,dimV)
(region[rDict['left shear web, left biax laminate']].V_cells, region[rDict['left shear web, left biax laminate']].H_cells) = (nV,nH)
# left shear web, foam core ############## SW_corners[0,1,:,:]
(dimH,dimV) = cg.calcCornerDims(SW_corners[0,1,:,:])
(nH,nV) = cg.calcCellNums(dimH,SW_foam_plies,maxAR,dimV)
(region[rDict['left shear web, foam core']].V_cells, region[rDict['left shear web, foam core']].H_cells) = (nV,nH)
# left shear web, right biax laminate ############## SW_corners[0,2,:,:]
(dimH,dimV) = cg.calcCornerDims(SW_corners[0,2,:,:])
(nH,nV) = cg.calcCellNums(dimH,SW_biax_plies,maxAR,dimV)
(region[rDict['left shear web, right biax laminate']].V_cells, region[rDict['left shear web, right biax laminate']].H_cells) = (nV,nH)

# right shear web, left biax laminate ############## SW_corners[1,0,:,:]
(dimH,dimV) = cg.calcCornerDims(SW_corners[1,0,:,:])
(nH,nV) = cg.calcCellNums(dimH,SW_biax_plies,maxAR,dimV)
(region[rDict['right shear web, left biax laminate']].V_cells, region[rDict['right shear web, left biax laminate']].H_cells) = (nV,nH)
# right shear web, foam core ############## SW_corners[1,1,:,:]
(dimH,dimV) = cg.calcCornerDims(SW_corners[1,1,:,:])
(nH,nV) = cg.calcCellNums(dimH,SW_foam_plies,maxAR,dimV)
(region[rDict['right shear web, foam core']].V_cells, region[rDict['right shear web, foam core']].H_cells) = (nV,nH)
# right shear web, right biax laminate ############## SW_corners[1,2,:,:]
(dimH,dimV) = cg.calcCornerDims(SW_corners[1,2,:,:])
(nH,nV) = cg.calcCellNums(dimH,SW_biax_plies,maxAR,dimV)
(region[rDict['right shear web, right biax laminate']].V_cells, region[rDict['right shear web, right biax laminate']].H_cells) = (nV,nH)

# bottom spar cap ############## SC_corners[1,:,:]
(dimH,dimV) = cg.calcCornerDims(SC_corners[1,:,:])
(nV,nH) = cg.calcCellNums(dimV,SC_plies,maxAR,dimH)
(region[rDict['bottom spar cap']].V_cells, region[rDict['bottom spar cap']].H_cells) = (nV,nH)

# top spar cap ############## SC_corners[0,:,:]
(dimH,dimV) = cg.calcCornerDims(SC_corners[0,:,:])
(nV,nH) = cg.calcCellNums(dimV,SC_plies,maxAR,dimH)
(region[rDict['top spar cap']].V_cells, region[rDict['top spar cap']].H_cells) = (nV,nH)




################################################################################################################################################
# make control nodes at ply boundaries
# region 1 ################### (left shear web, left biax laminate)
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['left shear web, left biax laminate'], node, number_of_nodes, 'bottom')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['left shear web, left biax laminate'], node, number_of_nodes, 'top')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['left shear web, left biax laminate'], node, number_of_nodes, 'left')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['left shear web, left biax laminate'], node, number_of_nodes, 'right')

# region 3 ################### (left shear web, right biax laminate)
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['left shear web, right biax laminate'], node, number_of_nodes, 'bottom')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['left shear web, right biax laminate'], node, number_of_nodes, 'top')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['left shear web, right biax laminate'], node, number_of_nodes, 'left')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['left shear web, right biax laminate'], node, number_of_nodes, 'right')

# region 2 ################### (left shear web, foam core)
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['left shear web, foam core'], node, number_of_nodes, 'bottom')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['left shear web, foam core'], node, number_of_nodes, 'top')
region[rDict['left shear web, foam core']].edgeL = region[rDict['left shear web, left biax laminate']].edgeR
region[rDict['left shear web, foam core']].edgeR = region[rDict['left shear web, right biax laminate']].edgeL


# region 4 ################### (right shear web, left biax laminate)
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['right shear web, left biax laminate'], node, number_of_nodes, 'bottom')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['right shear web, left biax laminate'], node, number_of_nodes, 'top')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['right shear web, left biax laminate'], node, number_of_nodes, 'left')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['right shear web, left biax laminate'], node, number_of_nodes, 'right')

# region 6 ################### (right shear web, right biax laminate)
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['right shear web, right biax laminate'], node, number_of_nodes, 'bottom')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['right shear web, right biax laminate'], node, number_of_nodes, 'top')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['right shear web, right biax laminate'], node, number_of_nodes, 'left')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['right shear web, right biax laminate'], node, number_of_nodes, 'right')

# region 5 ################### (right shear web, foam core)
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['right shear web, foam core'], node, number_of_nodes, 'bottom')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['right shear web, foam core'], node, number_of_nodes, 'top')
region[rDict['right shear web, foam core']].edgeL = region[rDict['right shear web, left biax laminate']].edgeR
region[rDict['right shear web, foam core']].edgeR = region[rDict['right shear web, right biax laminate']].edgeL

# region 7 ################### (bottom spar cap)
SC_top_x3 = SC_corners[1,0,1]
SC_bottom_x3 = SC_corners[1,2,1]
SC_middle_x3 = SC_bottom_x3 + abs(SC_top_x3 - SC_bottom_x3)/SC_plies
# edit the right edge of region[3] (left shear web, right biax laminate) to match the ply thicknesses of region[7]
n = 0
while region[rDict['left shear web, right biax laminate']].edgeR[n].x3 < SC_middle_x3:
    n += 1
region[rDict['left shear web, right biax laminate']].edgeR[n].x3 = SC_middle_x3  # reassign the x3 value, to align the shear web gridpoint with the adjacent spar cap plies
while region[rDict['left shear web, right biax laminate']].edgeR[n].x3 < SC_top_x3:
    n += 1
region[rDict['left shear web, right biax laminate']].edgeR[n].x3 = SC_top_x3
# assign the left edge of region[7] to a subset of the right edge of region[3]
region[rDict['bottom spar cap']].edgeL = region[rDict['left shear web, right biax laminate']].edgeR[:n+1]
region[rDict['bottom spar cap']].cornerNode4 = region[rDict['bottom spar cap']].edgeL[-1]

# edit the left edge of region[4] (right shear web, left biax laminate) to match the ply thicknesses of region[8]
n = 0
while region[rDict['right shear web, left biax laminate']].edgeL[n].x3 < SC_middle_x3:
    n += 1
region[rDict['right shear web, left biax laminate']].edgeL[n].x3 = SC_middle_x3  # reassign the x3 value, to align the shear web gridpoint with the adjacent spar cap plies
while region[rDict['right shear web, left biax laminate']].edgeL[n].x3 < SC_top_x3:
    n += 1
region[rDict['right shear web, left biax laminate']].edgeL[n].x3 = SC_top_x3
# assign the right edge of region[7] to a subset of the left edge of region[4]
region[rDict['bottom spar cap']].edgeR = region[rDict['right shear web, left biax laminate']].edgeL[:n+1]
region[rDict['bottom spar cap']].cornerNode3 = region[rDict['bottom spar cap']].edgeR[-1]

# assign the top and bottom edges to region[7], as usual
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['bottom spar cap'], node, number_of_nodes, 'top')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['bottom spar cap'], node, number_of_nodes, 'bottom')




# region 8 ################### (top spar cap)
SC_top_x3 = SC_corners[0,0,1]
SC_bottom_x3 = SC_corners[0,2,1]
SC_middle_x3 = SC_bottom_x3 + abs(SC_top_x3 - SC_bottom_x3)/SC_plies
# edit the right edge of region[3] (left shear web, right biax laminate) to match the ply thicknesses of region[8]
n = -1
while region[rDict['left shear web, right biax laminate']].edgeR[n].x3 > SC_middle_x3:
    n -= 1
region[rDict['left shear web, right biax laminate']].edgeR[n].x3 = SC_middle_x3  # reassign the x3 value, to align the shear web gridpoint with the adjacent spar cap plies
while region[rDict['left shear web, right biax laminate']].edgeR[n].x3 > SC_bottom_x3:
    n -= 1
region[rDict['left shear web, right biax laminate']].edgeR[n].x3 = SC_bottom_x3
# assign the left edge of region[8] to a subset of the right edge of region[3]
region[rDict['top spar cap']].edgeL = region[rDict['left shear web, right biax laminate']].edgeR[n:]
region[rDict['top spar cap']].cornerNode1 = region[rDict['top spar cap']].edgeL[0]

# edit the left edge of region[4] (right shear web, left biax laminate) to match the ply thicknesses of region[8]
n = -1
while region[rDict['right shear web, left biax laminate']].edgeL[n].x3 > SC_middle_x3:
    n -= 1
region[rDict['right shear web, left biax laminate']].edgeL[n].x3 = SC_middle_x3  # reassign the x3 value, to align the shear web gridpoint with the adjacent spar cap plies
while region[rDict['right shear web, left biax laminate']].edgeL[n].x3 > SC_bottom_x3:
    n -= 1
region[rDict['right shear web, left biax laminate']].edgeL[n].x3 = SC_bottom_x3
# assign the right edge of region[8] to a subset of the left edge of region[4]
region[rDict['top spar cap']].edgeR = region[rDict['right shear web, left biax laminate']].edgeL[n:]
region[rDict['top spar cap']].cornerNode2 = region[rDict['top spar cap']].edgeR[0]

# assign the top and bottom edges to region[8], as usual
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['top spar cap'], node, number_of_nodes, 'top')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, rDict['top spar cap'], node, number_of_nodes, 'bottom')













# fill region 1 (left shear web, left biax laminate)
(number_of_elements,element,number_of_nodes,node) = tqg.fillInteriorQuadElements(rDict['left shear web, left biax laminate'],region,
                                                                                 number_of_elements,element,
                                                                                 number_of_nodes,node)

# fill region 2 (left shear web, foam core)
(number_of_elements,element,
 number_of_nodes,node,
coarseEdgeL,coarseEdgeR) = tqg.fillBoundaryTriElements(rDict['left shear web, foam core'],region,
                                                       number_of_elements,element,
                                                       number_of_nodes,node)
(number_of_elements,element,number_of_nodes,node) = tqg.fillInteriorQuadElements(rDict['left shear web, foam core'],region,
                                                       number_of_elements,element,
                                                       number_of_nodes,node,
                                                       coarse_flag=True,
                                                       temp_coarseEdgeL=coarseEdgeL,temp_coarseEdgeR=coarseEdgeR)

# fill region 3 (left shear web, right biax laminate)
(number_of_elements,element,number_of_nodes,node) = tqg.fillInteriorQuadElements(rDict['left shear web, right biax laminate'],region,
                                                                                 number_of_elements,element,
                                                                                 number_of_nodes,node)

# fill region 4 (right shear web, left biax laminate)
(number_of_elements,element,number_of_nodes,node) = tqg.fillInteriorQuadElements(rDict['right shear web, left biax laminate'],region,
                                                                                 number_of_elements,element,
                                                                                 number_of_nodes,node)

# fill region 5 (right shear web, foam core)
(number_of_elements,element,
 number_of_nodes,node,
coarseEdgeL,coarseEdgeR) = tqg.fillBoundaryTriElements(rDict['right shear web, foam core'],region,
                                                       number_of_elements,element,
                                                       number_of_nodes,node)
(number_of_elements,element,number_of_nodes,node) = tqg.fillInteriorQuadElements(rDict['right shear web, foam core'],region,
                                                       number_of_elements,element,
                                                       number_of_nodes,node,
                                                       coarse_flag=True,
                                                       temp_coarseEdgeL=coarseEdgeL,temp_coarseEdgeR=coarseEdgeR)

# fill region 6 (right shear web, right biax laminate)
(number_of_elements,element,number_of_nodes,node) = tqg.fillInteriorQuadElements(rDict['right shear web, right biax laminate'],region,
                                                                                 number_of_elements,element,
                                                                                 number_of_nodes,node)

# fill region 7 (bottom spar cap)
(number_of_elements,element,
 number_of_nodes,node,
 coarseEdgeL,coarseEdgeR) = tqg.fillBoundaryTriElements(rDict['bottom spar cap'],region,
                                                        number_of_elements,element,
                                                        number_of_nodes,node,
                                                        debug_flag=False)
(number_of_elements,element,number_of_nodes,node) = tqg.fillInteriorQuadElements(rDict['bottom spar cap'],region,
                                                        number_of_elements,element,
                                                        number_of_nodes,node,
                                                        coarse_flag=True,
                                                        temp_coarseEdgeL=coarseEdgeL,temp_coarseEdgeR=coarseEdgeR)

# fill region 8 (top spar cap)
(number_of_elements,element,
 number_of_nodes,node,
 coarseEdgeL,coarseEdgeR) = tqg.fillBoundaryTriElements(rDict['top spar cap'],region,
                                                        number_of_elements,element,
                                                        number_of_nodes,node,
                                                        debug_flag=False)
(number_of_elements,element,number_of_nodes,node) = tqg.fillInteriorQuadElements(rDict['top spar cap'],region,
                                                        number_of_elements,element,
                                                        number_of_nodes,node,
                                                        coarse_flag=True,
                                                        temp_coarseEdgeL=coarseEdgeL,temp_coarseEdgeR=coarseEdgeR)















































# write the element connectivity in a way that Mayavi can understand and plot
conn = tqg.buildConnections(element,number_of_elements)

# assign all elements to layer 1, and set theta1 = 0.0 (just to test the VABS input file)
for i in range(1,number_of_elements+1):
    element[i].layer = layer[1]
    element[i].theta1 = 0.0


# verify that input was saved correctly
if main_debug_flag:
    print "REGIONS:"
    for i in range(1,number_of_regions+1):
        print ('#' + str(region[i].region_no) + '  (' + str(region[i].cornerNode1.node_no) + ', '
                                                      + str(region[i].cornerNode2.node_no) + ', '
                                                      + str(region[i].cornerNode3.node_no) + ', '
                                                      + str(region[i].cornerNode4.node_no) + ')' )


if plot_flag:   # plot the grid to the screen using mayavi
    # import the required plotting modules ######################################################################################################
    from mayavi import mlab
    import autogridgen.gridViz as gv
    # plot the grid #############################################################################################################################
    print "        - plotting the grid"

    if gridlines_flag:
        tqg.plotNodes(node,number_of_nodes,line_flag=True,connections=conn,circle_scale='0.0005')  # print nodes with element lines
    else:
        tqg.plotNodes(node,number_of_nodes,circle_scale='0.0005')  # print nodes without element lines
    
    if zoom_flag:
        tqg.nice2Dview(distance=0.07, focalpoint=np.array([-0.75, -0.32, 0.0]))  # zoomed view of shear web/spar cap interface
    else:
        tqg.nice2Dview(distance=2.5, focalpoint=np.array([0.004, -0.02, 0.0]))  # full view of cross-section
    # tqg.showAxes()



# write to the VABS input file #############################################################################################################################
if runVABS_flag:
    print "STATUS: writing the VABS input file:", vabs_filename
    import VABSutilities as vu

    curved = 1  # curve flag is set to True
    twist_rate = 0.0  # twist_rate = k1, which is in units of rad/m (twist rate)

    VABSflag_dictionary = {'format_flag': 1,
                           'nlayer': number_of_layers,
                           'Timoshenko_flag': 1,
                           'recover_flag': 0,
                           'thermal_flag': 0,
                           'curve_flag': curved,
                           'oblique_flag': 0,
                           'trapeze_flag': 0,
                           'Vlasov_flag': 0,
                           'k1': twist_rate,
                           'k2': 0.0,
                           'k3': 0.0,
                           'nnode': number_of_nodes,
                           'nelem': number_of_elements,
                           'nmate': number_of_materials}
                           # package all the VABS flags into one dictionary
    vu.writeVABSfile(vabs_filename, node, layer, material, element, VABSflag_dictionary)


# calculate the time it took to run the code #####################################################################################################################
elapsed_time_tot = time.time() - start_time

print "program completed in", ("%.2f" % round(elapsed_time_tot,2)), "seconds"

if runVABS_flag:
  # run the input file with VABS from the Windows command line
  print ""
  print "RUNNING VABS....."
  os.system('.\VABS\VABSIII .\cs_input_file.dat')
