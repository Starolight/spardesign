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
plot_grid_flag = True
plot_layer_flag = True
plot_material_flag = False
main_debug_flag = False
spar_stn = 23   # run the 23rd spar station
maxAR = 28.0  # according to PreVABS, the cell aspect ratio is usually set from 3.0-8.0 ... maybe 1.2 is too small (high mem usage!)
vabs_filename = 'SW_input_file.dat'


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


# create VABS objects for nodes and elements for the entire cross-section ############################################################################################
print "STATUS: create VABS nodes and elements for the ENTIRE CROSS-SECTION..."

node = []
element = []
region = []
number_of_nodes = 0
number_of_elements = 0
number_of_regions = 0

# fill index 0 of node, element, and region lists (index 0 is unused)
(node, element, region) = tqg.fillUnusedZeroIndex(node, element, region)

# fill in nodes at 8 corners
for i in range(1,9):
    node.append(vo.nodeObj())
    node[i].node_no = i
    number_of_nodes += 1


# modify this block of code to replace the block of code above it
data = rl.readLayupFile('autogridgen/monoplane_spar_layup.txt')  # import the data from the layup file
SW_corners = rl.extract_SW_corners(data,spar_stn)
## left shear web ###########################################################
# left biax laminate #
(node[1].x2, node[1].x3) = (SW_corners[0,0,2,0], SW_corners[0,0,2,1])
(node[2].x2, node[2].x3) = (SW_corners[0,0,3,0], SW_corners[0,0,3,1])
(node[3].x2, node[3].x3) = (SW_corners[0,0,1,0], SW_corners[0,0,1,1])
(node[4].x2, node[4].x3) = (SW_corners[0,0,0,0], SW_corners[0,0,0,1])

# right biax laminate #
(node[5].x2, node[5].x3) = (SW_corners[0,2,2,0], SW_corners[0,2,2,1])
(node[6].x2, node[6].x3) = (SW_corners[0,2,3,0], SW_corners[0,2,3,1])
(node[7].x2, node[7].x3) = (SW_corners[0,2,1,0], SW_corners[0,2,1,1])
(node[8].x2, node[8].x3) = (SW_corners[0,2,0,0], SW_corners[0,2,0,1])



# fill in 3 regions
for i in range(1,4):
    region.append(tqg.regionObj())
    region[i].region_no = i
    number_of_regions += 1
# name regions
region[1].name = 'SW_biaxL'
region[2].name = 'SW_foam'
region[3].name = 'SW_biaxR'
## set number of plies for each structural component ##
SC_plies = 2       # spar cap has 2 plies:                      [0]_2
RB_plies = 6       # root buildup has 6 plies:                  [+/-45]_2 [0]_2
SW_biax_plies = 8  # biaxial laminate in shear web has 8 plies: [+/-45]_4
SW_foam_plies = 8  # set the foam part of the shear web to some arbitrary number (the foam doesn't really have plies)
# assign number of cells distributed along horizontal axis
region[1].H_cells = SW_biax_plies
region[2].H_cells = SW_foam_plies
region[3].H_cells = SW_biax_plies


# assign number of cells distributed along vertical axis
#       this will be autofilled by maxAR method
# left biax laminate #
(dimH,dimV) = cg.calcCornerDims(SW_corners[0,0,:,:])
(nH,nV) = cg.calcCellNums(dimH,SW_biax_plies,maxAR,dimV)
(nrows,ncols) = (nV,nH)
region[1].V_cells = nrows
# foam laminate #
(dimH,dimV) = cg.calcCornerDims(SW_corners[0,1,:,:])
(nH,nV) = cg.calcCellNums(dimH,SW_foam_plies,maxAR,dimV)
(nrows,ncols) = (nV,nH)
region[2].V_cells = nrows
# right biax laminate #
(dimH,dimV) = cg.calcCornerDims(SW_corners[0,2,:,:])
(nH,nV) = cg.calcCellNums(dimH,SW_biax_plies,maxAR,dimV)
(nrows,ncols) = (nV,nH)
region[3].V_cells = nrows
# assign corner nodes to each region

(region[1].cornerNode1, region[1].cornerNode2, region[1].cornerNode3, region[1].cornerNode4) = (node[1], node[2], node[3], node[4])
(region[2].cornerNode1, region[2].cornerNode2, region[2].cornerNode3, region[2].cornerNode4) = (node[2], node[5], node[8], node[3])
(region[3].cornerNode1, region[3].cornerNode2, region[3].cornerNode3, region[3].cornerNode4) = (node[5], node[6], node[7], node[8])
# verify that input was saved correctly
if main_debug_flag:
    print "REGIONS:"
    for i in range(1,number_of_regions+1):
        print ('#' + str(region[i].region_no) + '  (' + str(region[i].cornerNode1.node_no) + ', '
                                                      + str(region[i].cornerNode2.node_no) + ', '
                                                      + str(region[i].cornerNode3.node_no) + ', '
                                                      + str(region[i].cornerNode4.node_no) + ')' )
# make control nodes at ply boundaries
# region 1
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, 1, node, number_of_nodes, 'bottom')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, 1, node, number_of_nodes, 'top')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, 1, node, number_of_nodes, 'left')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, 1, node, number_of_nodes, 'right')

# region 3
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, 3, node, number_of_nodes, 'bottom')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, 3, node, number_of_nodes, 'top')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, 3, node, number_of_nodes, 'left')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, 3, node, number_of_nodes, 'right')

# region 2
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, 2, node, number_of_nodes, 'bottom')
(region, node, number_of_nodes) = tqg.makeEdgeNodes(region, 2, node, number_of_nodes, 'top')
region[2].edgeL = region[1].edgeR
region[2].edgeR = region[3].edgeL

if main_debug_flag:
    tqg.printEdgeNodes(region, 1)
    tqg.printEdgeNodes(region, 2)
    tqg.printEdgeNodes(region, 3)


# fill region 1
(number_of_elements,element,number_of_nodes,node) = tqg.fillInteriorQuadElements(1,region,
                                                                             number_of_elements,element,
                                                                             number_of_nodes,node)

# fill region 2
(number_of_elements,element,
 number_of_nodes,node,
coarseEdgeL,coarseEdgeR) = tqg.fillBoundaryTriElements(2,region,
                                                    number_of_elements,element,
                                                    number_of_nodes,node)
if main_debug_flag:
    print "COARSE EDGE (LEFT):"
    edgeList = tqg.genEdgeNodeNumbers(coarseEdgeL)
    print edgeList
    print "COARSE EDGE (RIGHT):"
    edgeList = tqg.genEdgeNodeNumbers(coarseEdgeR)
    print edgeList
(number_of_elements,element,number_of_nodes,node) = tqg.fillInteriorQuadElements(2,region,
                                                        number_of_elements,element,
                                                        number_of_nodes,node,
                                                        coarse_flag=True,
                                                        temp_coarseEdgeL=coarseEdgeL,temp_coarseEdgeR=coarseEdgeR)

# fill region 3
(number_of_elements,element,number_of_nodes,node) = tqg.fillInteriorQuadElements(3,region,
                                                                             number_of_elements,element,
                                                                             number_of_nodes,node)




# write the element connectivity in a way that Mayavi can understand and plot
conn = tqg.buildConnections(element,number_of_elements)

# assign all elements to layer 1, and set theta1 = 0.0 (just to test the VABS input file)
for i in range(1,number_of_elements+1):
    element[i].layer = layer[1]
    element[i].theta1 = 0.0





if plot_grid_flag:   # plot the grid to the screen using mayavi
    # import the required plotting modules ######################################################################################################
    from mayavi import mlab
    import autogridgen.gridViz as gv


    # plot the grid #############################################################################################################################
    print "        - plotting the grid"
    # verify that input was saved correctly
    # plotNodes(node,number_of_nodes)  # print nodes without element lines
    tqg.plotNodes(node,number_of_nodes,line_flag=True,connections=conn,circle_scale='0.0005')  # print nodes with element lines
    tqg.nice2Dview(distance=1.4, focalpoint=np.array([-0.8, -0.035, 0.0]))
    tqg.showAxes()
    # printElementNodes(number_of_elements,element)



# write to the VABS input file #############################################################################################################################
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

# run the input file with VABS from the Windows command line
print ""
print "RUNNING VABS....."
os.system('.\VABS\VABSIII .\SW_input_file.dat')