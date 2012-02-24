import numpy as np    # import the numpy module; rename it as np


class nodeObj:        # a node is a grid point (vertex)
    node_no = np.nan  # integer representing the unique number assigned to each node
    x2 = np.nan       # x2-coordinate of this node
    x3 = np.nan       # x3-coordinate of this node

    ### inspect all properties of a node (node number, x2-coordinate, x3-coordinate)
    ###     input: thisNode <vo.nodeObj>, an individual element (for example, node[3])
    ###     output: <none>, prints to the screen
    def inspect(self,funcCallFlag=False):
        if funcCallFlag:
            print '  inspecting node #' + str(self.node_no)
            print '    Coordinates, (x2, x3) = ' + '(' + str(self.x2) + ', ' + str(self.x3) + ')'
        else:
            print 'INSPECTING NODE #' + str(self.node_no)
            print '  Coordinates, (x2, x3) = ' + '(' + str(self.x2) + ', ' + str(self.x3) + ')'
        return


class materialObj:        # a material with its constants (Young's modulus, Poisson's ratio, etc.)
    material_no = np.nan  # integer representing the unique number assigned to each material
    material_name = ''    # string representing the written name of the material
    orth_flag = np.nan    # flag to indicate if matl is isotropic (0), 
                          #                             orthotropic (1), or 
                          #                             general anisotropic (2)
    rho = np.nan          # density
    color = ''            # color used to fill all elements assigned with this material
    rgb = ()              # RGB tuple used to represent the color for this material


class layerObj:        # a layer is a unique combination of material type and layup orientation (theta3)
    layer_no = np.nan  # integer representing the unique number assigned to each layer
    material = materialObj()  # material of this layer
    theta3 = np.nan    # layup angle (in degrees) for this layer
    color = ''         # color used to fill all elements assigned with this layer
    rgb = ()           # RGB tuple used to represent the color for this layer


class isotropicMatlObj(materialObj):  # an isotropic material object (subclass)
    E = np.nan     # Young's modulus
    nu = np.nan    # Poisson's ratio


class orthotropicMatlObj(materialObj):  # an orthotropic material object (subclass)
    E1 = np.nan     # Young's modulus in x1-direction (along beam axis)
    E2 = np.nan     # Young's modulus in x2-direction (along chord line)
    E3 = np.nan     # Young's modulus in x3-direction (in direction of cross-section thickness)
    G12 = np.nan    # shear modulus in the x1x2-plane
    G13 = np.nan    # shear modulus in the x1x3-plane
    G23 = np.nan    # shear modulus in the x2x3-plane
    nu12 = np.nan   # Poisson's ratio in the x1x2-plane
    nu13 = np.nan   # Poisson's ratio in the x1x3-plane
    nu23 = np.nan   # Poisson's ratio in the x2x3-plane


class elementObj:     # an element (quadrilateral cell) is made up of four nodes
    elem_no = np.nan  # integer representing the unique number assigned to each element
    node1 = nodeObj() # node 1 (bottom left corner) of this element
    node2 = nodeObj() # node 2 (bottom right corner) of this element
    node3 = nodeObj() # node 3 (top right corner) of this element
    node4 = nodeObj() # node 4 (top left corner) of this element
    layer = layerObj() # layer of this element
    theta1 = np.nan   # layer plane angle (in degrees) for the layer used by this element

    upper_border_y = np.array([np.nan,np.nan])
    lower_border_y = np.array([np.nan,np.nan])
    lower_border_x = np.array([np.nan,np.nan])

    ### inspect all properties of an element (element number, properties of all nodes that make up this element)
    ###     input: thisElement <vo.elementObj>, an individual element (for example, element[36])
    ###     output: <none>, prints to the screen
    def inspect(self):
        print 'INSPECTING ELEMENT #' + str(self.elem_no)
        print 'INSPECTING NODE1********'
        self.node1.inspect(funcCallFlag=True)
        print 'INSPECTING NODE2********'
        self.node2.inspect(funcCallFlag=True)
        print 'INSPECTING NODE3********'
        self.node3.inspect(funcCallFlag=True)
        print 'INSPECTING NODE4********'
        self.node4.inspect(funcCallFlag=True)
        return


## fill the list with nnode+1 node objects (we won't use the first index, 0)
##    input: nnode <int>, number of nodes in this grid
##           node_list <object>, list of unique node objects
##    output: <none>
def fillNodeObjects(nnode, node_list):
    for i in range(nnode+1):  
        node_list.append(nodeObj())
    return


## fill the list with nlayer+1 layer objects (we won't use the first index, 0)
##    input: nlayer <int>, number of layers in this grid
##           layer_list <object>, list of layer objects
##    output: <none>
def fillLayerObjects(nlayer, layer_list):
    for i in range(nlayer+1):  
        layer_list.append(layerObj())
    return


## fill the list with nmate+1 material objects (we won't use the first index, 0)
##    input: nmate <int>, number of layers in this grid
##           material_list <object>, list of layer objects
##    output: <none>
def fillMaterialObjects(nmate, material_list):
    for i in range(nmate+1):  # traverse the list of material objects
        if i == 0:
            material_list.append(materialObj())  # assign a dummy material to the 0th-index
        elif i == 4:  ### WARNING: this is hard-coded! must change for new grids with new materials!
            # assign material4 to be isotropic (this will be foam)
            material_list.append(isotropicMatlObj())
        else:  ### WARNING: this is hard-coded! must change for new grids with new materials!
            # assign all other material numbers to be orthotropic (these with be GFRP composites)
            material_list.append(orthotropicMatlObj())
    return


## assign constants to each material object
##    input: nmate <int>, number of materials in this grid
##           material_list <object>, list of material objects
##    output: <none>
def assignMaterials(nmate, material_list):
    for i in range(1,nmate+1):  # traverse the list of material objects
        material_list[i].material_no = i
        if i == 1:
            # uniaxial GFRP
            material_list[i].orth_flag = 1
            material_list[i].material_name = 'E-LT-5500/EP-3'
            (material_list[i].E1, material_list[i].E2, material_list[i].E3) = (41.8E+09, 14.0E+09, 14.0E+09)
            (material_list[i].G12, material_list[i].G13, material_list[i].G23) = (2.63E+09, 2.63E+09, 2.63E+09)
            (material_list[i].nu12, material_list[i].nu13, material_list[i].nu23) = (0.28, 0.28, 0.28)
            material_list[i].rho = 1.92E+03
            material_list[i].color = 'grey'
            material_list[i].rgb = (0.502,0.502,0.502)
        elif i == 2:
            # biaxial GFRP
            material_list[i].orth_flag = 1
            material_list[i].material_name = 'Saertex/EP-3'
            (material_list[i].E1, material_list[i].E2, material_list[i].E3) = (13.6E+09, 13.3E+09, 13.3E+09)
            (material_list[i].G12, material_list[i].G13, material_list[i].G23) = (11.8E+09, 11.8E+09, 11.8E+09)
            (material_list[i].nu12, material_list[i].nu13, material_list[i].nu23) = (0.51, 0.51, 0.51)
            material_list[i].rho = 1.78E+03
            material_list[i].color = 'teal'
            material_list[i].rgb = (0,0.502,0.502)
        elif i == 3:
            # triaxial GFRP
            material_list[i].orth_flag = 1
            material_list[i].material_name = 'SNL Triax'
            (material_list[i].E1, material_list[i].E2, material_list[i].E3) = (27.7E+09, 13.65E+09, 13.65E+09)
            (material_list[i].G12, material_list[i].G13, material_list[i].G23) = (7.20E+09, 7.20E+09, 7.20E+09)
            (material_list[i].nu12, material_list[i].nu13, material_list[i].nu23) = (0.39, 0.39, 0.39)
            material_list[i].rho = 1.85E+03
            material_list[i].color = 'pink'
            material_list[i].rgb = (1,0.753,0.796)
        elif i == 4:
            # foam
            material_list[i].orth_flag = 0
            material_list[i].material_name = 'Foam'
            material_list[i].E = 0.256E+09
            material_list[i].nu = 0.3
            material_list[i].rho = 0.20E+03
            material_list[i].color = 'orange'
            material_list[i].rgb = (1,0.647,0)
    return


## fill the list with nelem+1 element objects (we won't use the first index, 0)
##    input: nelem <int>, number of elements in this grid
##           elem <object>, list of element objects
##    output: <none>
def fillElementObjects(nelem, elem):
    for j in range(nelem+1):  
        elem.append(elementObj())
    return


## assign x&y coordinates to each node object
##    input: nnode <int>, number of nodes in this grid
##           coordinates <array>, a numpy array of x&y coordinates for each node
##           node_list <object>, list of unique node objects
##    output: <none>
def assignCoordinatesToNodes(nnode, coordinates, node_list):
    for i in range(1,nnode+1):  # traverse the list of node objects
        node_list[i].node_no = i
        node_list[i].x2 = coordinates[i-1,0]  # assign the x2-coordinate for the i-th node
        node_list[i].x3 = coordinates[i-1,1]  # assign the x3-coordinate for the i-th node
    return


## assign materials and layup angles (theta3) to each layer object
##    ...define each layer manually (for now)
##    input: layer_list <object>, list of layer objects
##           matl <object> list of material objects
##    output: <none>
def assignLayers(layer_list, matl):
    layer_list[1].layer_no = 1       # layer 1
    layer_list[1].material = matl[1] # uniaxial GFRP
    layer_list[1].theta3 = 0.0       # 0 degrees, layup angle
    layer_list[1].color = 'red'      # color to fill elements assigned with this layer
    layer_list[1].rgb = (1,0,0)      # RGB code for fill color

    layer_list[2].layer_no = 2       # layer 2
    layer_list[2].material = matl[2] # biaxial GFRP
    layer_list[2].theta3 = 45.0      # 45 degrees, layup angle
    layer_list[2].color = 'green'    # color to fill elements assigned with this layer
    layer_list[2].rgb = (0,0.514,0)  # RGB code for fill color

    layer_list[3].layer_no = 3       # layer 3
    layer_list[3].material = matl[2] # biaxial GFRP
    layer_list[3].theta3 = -45.0     # -45 degrees, layup angle
    layer_list[3].color = 'cyan'     # color to fill elements assigned with this layer
    layer_list[3].rgb = (0,1,1)      # RGB code for fill color

    layer_list[4].layer_no = 4       # layer 4
    layer_list[4].material = matl[3] # triaxial GFRP
    layer_list[4].theta3 = 45.0      # 45 degrees, layup angle
    layer_list[4].color = 'tan'      # color to fill elements assigned with this layer
    layer_list[4].rgb = (0,0.706,0.549)

    layer_list[5].layer_no = 5       # layer 5
    layer_list[5].material = matl[3] # triaxial GFRP
    layer_list[5].theta3 = -45.0     # -45 degrees, layup angle
    layer_list[5].color = 'yellow'   # color to fill elements assigned with this layer
    layer_list[5].rgb = (1,1,0)      # RGB code for fill color

    layer_list[6].layer_no = 6       # layer 6
    layer_list[6].material = matl[3] # triaxial GFRP
    layer_list[6].theta3 = 0.0       # 0 degrees, layup angle
    layer_list[6].color = 'blue'     # color to fill elements assigned with this layer
    layer_list[6].rgb = (0,0,1)      # RGB code for fill color

    layer_list[7].layer_no = 7       # layer 7
    layer_list[7].material = matl[4] # foam
    layer_list[7].theta3 = 0.0       # 0 degrees, layup angle
    layer_list[7].color = 'magenta'  # color to fill elements assigned with this layer
    layer_list[7].rgb = (1,0,1)      # RGB code for fill color

    return


## assign nodes to each element object
##    use the order from the connectivity array
##    ... may need to correct some of these assigments later if orientation of nodes is wrong
##    input: nelem <int>, number of elements in this grid
##           connectivity <array>, a numpy array of node numbers describing the connectivity of each element
##           elem <object>, list of element objects
##           node_list <object>, list of unique node objects
##    output: <none>
def assignNodesToElements(nelem, connectivity, elem, node_list):
    for j in range(1,nelem+1):  # traverse the list of element objects
        elem[j].elem_no = j

        unique_node_number_for_node1 = connectivity[j-1,0]
        unique_node_number_for_node2 = connectivity[j-1,1]
        unique_node_number_for_node3 = connectivity[j-1,2]
        unique_node_number_for_node4 = connectivity[j-1,3]
        # print unique_node_number_for_node1, unique_node_number_for_node2, unique_node_number_for_node3, unique_node_number_for_node4
        elem[j].node1 = node_list[unique_node_number_for_node1]
        # print j, node_list[unique_node_number_for_node1].x2, node_list[unique_node_number_for_node1].x3
        # print j, elem[j].node[1].x2, elem[j].node[1].x3
        elem[j].node2 = node_list[unique_node_number_for_node2]
        elem[j].node3 = node_list[unique_node_number_for_node3]
        elem[j].node4 = node_list[unique_node_number_for_node4]
    return


## find the "middle" x&y coordinates of this element
##    input: single_element <object>, a single element object (e.g. elem[1])
##    output: x_middle <double>, x2-coordinate of the middle of this element
##            y_middle <double>, x3-coordinate of the middle of this element
def findMiddleCoordinatesOfElement(single_element):
    x1 = single_element.node1.x2
    x2 = single_element.node2.x2
    x3 = single_element.node3.x2
    x4 = single_element.node4.x2
    y1 = single_element.node1.x3
    y2 = single_element.node2.x3
    y3 = single_element.node3.x3
    y4 = single_element.node4.x3
    x_middle = (x1 + x2 + x3 + x4)/4.0
    y_middle = (y1 + y2 + y3 + y4)/4.0
    return (x_middle, y_middle)

## determine if the nodes are ordered according to the VABS convention
##     node 1 (bottom left corner) of this element
##     node 2 (bottom right corner) of this element
##     node 3 (top right corner) of this element
##     node 4 (top left corner) of this element
##     input: single_element <object>, a single element object (e.g. elem[1])
##     output: nodes_sorted <logical>, a flag that is True when the nodes are ordered according to the VABS convention
def areNodesSortedByVABSconvention(single_element):
    (x_middle, y_middle) = findMiddleCoordinatesOfElement(single_element)

    x1 = single_element.node1.x2
    x2 = single_element.node2.x2
    x3 = single_element.node3.x2
    x4 = single_element.node4.x2
    y1 = single_element.node1.x3
    y2 = single_element.node2.x3
    y3 = single_element.node3.x3
    y4 = single_element.node4.x3
    
    node1_flag = (x1 < x_middle) and (y1 < y_middle)
    node2_flag = (x2 > x_middle) and (y2 < y_middle)
    node3_flag = (x3 > x_middle) and (y3 > y_middle)
    node4_flag = (x4 < x_middle) and (y4 > y_middle)

    nodes_sorted = node1_flag and node2_flag and node3_flag and node4_flag
    # print node1_flag, node2_flag, node3_flag, node4_flag
    return nodes_sorted


## reassign the nodes on a single element according to the VABS convention
##     node 1 (bottom left corner) of this element
##     node 2 (bottom right corner) of this element
##     node 3 (top right corner) of this element
##     node 4 (top left corner) of this element
##     input: single_element <object>, a single element object (e.g. elem[1])
##     output: <none>
def reassignNodesOnElement(single_element):
    (x_middle, y_middle) = findMiddleCoordinatesOfElement(single_element)

    def updateNodeFlags(one_element):
        n1_flag = (one_element.node1.x2 < x_middle) and (one_element.node1.x3 < y_middle)
        n2_flag = (one_element.node2.x2 > x_middle) and (one_element.node2.x3 < y_middle)
        n3_flag = (one_element.node3.x2 > x_middle) and (one_element.node3.x3 > y_middle)
        n4_flag = (one_element.node4.x2 < x_middle) and (one_element.node4.x3 > y_middle)
        return (n1_flag, n2_flag, n3_flag, n4_flag)

    (node1_flag, node2_flag, node3_flag, node4_flag) = updateNodeFlags(single_element)
    counter1 = 0
    counter2 = 0
    counter3 = 0

    while (node1_flag == False) and (counter1 <= 10):
        temp = single_element.node4  # temporarily store the node assigned to the 4th position
        single_element.node4 = single_element.node1
        single_element.node1 = single_element.node2
        single_element.node2 = single_element.node3
        single_element.node3 = temp
        counter1 = counter1 + 1
        (node1_flag, node2_flag, node3_flag, node4_flag) = updateNodeFlags(single_element)
        
    while (node2_flag == False) and (counter2 <= 10):
        temp = single_element.node4  # temporarily store the node assigned to the 4th position
        single_element.node4 = single_element.node2
        single_element.node2 = single_element.node3
        single_element.node3 = temp
        counter2 = counter2 + 1
        (node1_flag, node2_flag, node3_flag, node4_flag) = updateNodeFlags(single_element)
        
    while (node3_flag == False) and (counter3 <= 10):
        temp = single_element.node4  # temporarily store the node assigned to the 4th position
        single_element.node4 = single_element.node3
        single_element.node3 = temp
        counter3 = counter3 + 1
        (node1_flag, node2_flag, node3_flag, node4_flag) = updateNodeFlags(single_element)
        
    (node1_flag, node2_flag, node3_flag, node4_flag) = updateNodeFlags(single_element)
    # print node1_flag, node2_flag, node3_flag, node4_flag
    return


## reassign nodes on all elements that don't follow the VABS convention
##    input: nelem <int>, number of elements in this grid
##           elem <object>, list of element objects
##    output: <none>
def reassignNodesOnAllBadElements(nelem, elem):
    for j in range(1,nelem+1):
        sorted_node_flag = areNodesSortedByVABSconvention(elem[j])
        if (sorted_node_flag == False):
            reassignNodesOnElement(elem[j])
            sorted_node_flag = areNodesSortedByVABSconvention(elem[j])
        # print elem[j].elem_no, sorted_node_flag
    return


## assign upper and lower borders to each element object
##    ...this will aid with filling in cells with different colors
##    input: nelem <int>, number of elements in this grid
##           elem <object>, list of element objects
##    output: <none>
def assignBordersToElements(nelem, elem):
    for i in range(1,nelem+1):  # traverse the list of element objects
        # assign the upper border y-coordinates (node4, node3)
        elem[i].upper_border_y = [elem[i].node4.x3, elem[i].node3.x3]
        # assign the lower border y-coordinates (node1, node2)
        elem[i].lower_border_y = [elem[i].node1.x3, elem[i].node2.x3]
        # assign the lower border x-coordinates (node1, node2)
        elem[i].lower_border_x = [elem[i].node1.x2, elem[i].node2.x2]
    return


## rewrite connectivity array, based on reassigned nodes [see reassignNodesOnAllBadElements()]
##    input: nelem <int>, the number of elements in this grid
##           elem <object>, the list of element objects
##           connectivity <array>, a numpy array of node numbers describing the connectivity of each element
##    output: <none>
def rewriteConnectivity(nelem, elem, connectivity):
    for i in range(1,nelem+1):  # traverse the list of element objects
        connectivity[i-1,0] = elem[i].node1.node_no
        connectivity[i-1,1] = elem[i].node2.node_no
        connectivity[i-1,2] = elem[i].node3.node_no
        connectivity[i-1,3] = elem[i].node4.node_no
    return


## define x-coordinate boundaries of spar caps and shear webs
##    (all dimensions have units of meters)
##    input: w_sc <double>, width of the spar cap
##           w_sw_biax <double>, width of the biaxial layer of the shear web
##           w_sw_foam <double>, width of the foam layer of the shear web
##    output: xa <double>, # x-coordinate of uniax-biax boundary (right edge of spar cap/left edge of shear web)
##            xb <double>, # x-coordinate of int_biax-foam boundary (right edge of interior biax layer/left edge of foam in shear web)
##            xc <double>, # x-coordinate of foam-ext_biax boundary (right edge of foam/left edge of exterior biax layer in shear web)
##            xd <double>, # x-coordinate of ext_biax boundary (right edge of exterior biax layer in shear web)
def defineSparCapShearWebBoundaries(w_sc, w_sw_biax, w_sw_foam):
    xa = w_sc/2.0        # uniax-biax boundary (right edge of spar cap/left edge of shear web)
    xb = xa + w_sw_biax  # int_biax-foam boundary (right edge of interior biax layer/left edge of foam in shear web)
    xc = xb + w_sw_foam  # foam-ext_biax boundary (right edge of foam/left edge of exterior biax layer in shear web)
    xd = xc + w_sw_biax  # ext_biax boundary (right edge of exterior biax layer in shear web)
    return (xa, xb, xc, xd)


## define y-coordinate boundary between spar cap and root buildup
##    input: h_sw <double>, height of the shear web
##           h_rb <double>, height of the root buildup
##    output: ya <double>, y-coordinate of boundary between spar cap and root buildup
def defineSparCapRootBuildupBoundary(h_sw, h_rb):
    ya = h_sw/2.0 - h_rb
    return ya


## define the thickness of each layer in a particular laminate
##    input: thick_laminate <double>, thickness of the entire laminate
##           nlayer_laminate <int>, the number of layers in the entire laminate
##    output: thick_layer <double>, thickness of each layer in the laminate
def defineLayerThickness(thick_laminate, nlayer_laminate):
    thick_layer = thick_laminate/nlayer_laminate
    return thick_layer


## calculate layer thicknesses for all laminates
def calcLayerThicknessesForAllLaminates(t_uniax,      t_biax,      t_triax,
                                        nlayer_uniax, nlayer_biax, nlayer_triax):
    t_uniax_layer = defineLayerThickness(t_uniax, nlayer_uniax)
    t_biax_layer  = defineLayerThickness(t_biax,  nlayer_biax )
    t_triax_layer = defineLayerThickness(t_triax, nlayer_triax)
    return (t_uniax_layer, t_biax_layer, t_triax_layer)


## find out if all four coordinates are within two bounds
##    ...coordinates are either x or y-coordinates, NOT coordinate pairs
##    input: c1 <double>, first coordinate
##           c2 <double>, second coordinate
##           c3 <double>, third coordinate
##           c4 <double>, fourth coordinate
##           c_lower <double>, lower bound coordinate
##           c_upper <double>, upper boundh coordinate
##    output: flag <logical>, true if all four coordinates are within bounds, false otherwise
def allFourCoordsAreWithinBounds(c1, c2, c3, c4, c_lower, c_upper):
    if c_upper < c_lower:
        temp = c_upper
        c_upper = c_lower
        c_lower = temp
        print "WARNING: c_upper < c_lower ... values have been automatically switched!"
    
    if ((c_lower <= c1 and c1 <= c_upper) and (c_lower <= c2 and c2 <= c_upper) and (c_lower <= c3 and c3 <= c_upper) and (c_lower <= c4 and c4 <= c_upper)):
        # all four coordinates ARE within the two bounds
        flag = True
    else:
        # all four coordinates are NOT within the two bounds
        flag = False
    return flag


## find out if one coordinate is within two bounds
##    ...coordinate is either x or y-coordinate, NOT a coordinate pair
##    input: c <double>, coordinate to test
##           c_lower <double>, lower bound coordinate
##           c_upper <double>, upper boundh coordinate
##    output: flag <logical>, true if coordinate is within bounds, false otherwise
def coordIsWithinBounds(c, c_lower, c_upper):
    if c_upper < c_lower:
        temp = c_upper
        c_upper = c_lower
        c_lower = temp
        print "WARNING: c_upper < c_lower ... values have been automatically switched!"
    
    if (c_lower <= c and c <= c_upper):
        # all four coordinates ARE within the two bounds
        flag = True
    else:
        # all four coordinates are NOT within the two bounds
        flag = False
    return flag


## find out if the middle coordinate of an element is within two bounds
##    ...coordinate is either x or y-coordinate, NOT a coordinate pair
##    input: single_element <object>, one element in the grid
##           lower_bound <double>, lower bound coordinate
##           upper_bound <double>, upper boundh coordinate
##           x_flag <logical>, true if lower_bound and upper_bound are x-coordinates, false if they are y-coordinates
##    output: result_flag <logical>, true if coordinate is within bounds, false otherwise
def middleCoordIsWithinBounds(single_element, lower_bound, upper_bound, x_flag):
    (x_m, y_m) = findMiddleCoordinatesOfElement(single_element)
    if x_flag:
        if coordIsWithinBounds(x_m, lower_bound, upper_bound):
            result_flag = True
        else:
            result_flag = False
    else:
        if coordIsWithinBounds(y_m, lower_bound, upper_bound):
            result_flag = True
        else:
            result_flag = False
    return result_flag


## determine which elements are made of which materials
##    input: w_sc <double>, width of the spar cap
##           w_sw_biax <double>, width of the biaxial laminate of the shear web
##           w_sw_foam <double>, width of the foam region of the shear web
##           h_sw <double>, height of the shear web
##           h_rb <double>, height of the root buildup
##           nelem <int>, number of elements in this grid
##    output: <none>
def defineLayerForEachElement(w_sc, w_sw_biax, w_sw_foam, h_sw, h_rb, nelem, elem, t_uniax, t_biax, t_triax, layer_list):
    (xa, xb, xc, xd) = defineSparCapShearWebBoundaries(w_sc, w_sw_biax, w_sw_foam)
    ya = defineSparCapRootBuildupBoundary(h_sw, h_rb)

    for j in range(1,nelem+1):  # traverse the array of element objects
        x1 = elem[j].node1.x2
        y1 = elem[j].node1.x3
        x2 = elem[j].node2.x2
        y2 = elem[j].node2.x3
        x3 = elem[j].node3.x2
        y3 = elem[j].node3.x3
        x4 = elem[j].node4.x2
        y4 = elem[j].node4.x3

        # uniaxial/triaxial GFRP
        if middleCoordIsWithinBounds(elem[j], -xa, xa, True):
            if middleCoordIsWithinBounds(elem[j], -ya, ya, False):
                # spar cap, uniaxial GFRP
                elem[j].layer = layer_list[1]  # layer_no = 1
                if ( (y1 >= 0) and (y2 >= 0) and (y3 >= 0) and (y4 >= 0) ):
                    # top spar cap
                    elem[j].theta1 = 0.0
                else:
                    # bottom spar cap
                    elem[j].theta1 = 180.0
            else:
                # root buildup, triaxial GFRP
                if ( (y1 >= 0) and (y2 >= 0) and (y3 >= 0) and (y4 >= 0) ):
                    # top root buildup
                    elem[j].theta1 = 0.0
                    if middleCoordIsWithinBounds(elem[j], ya+0.0*t_triax, ya+1.0*t_triax, False):
                        elem[j].layer = layer_list[4]  # layer_no = 4
                    elif middleCoordIsWithinBounds(elem[j], ya+1.0*t_triax, ya+2.0*t_triax, False):
                        elem[j].layer = layer_list[5]  # layer_no = 5
                    elif middleCoordIsWithinBounds(elem[j], ya+2.0*t_triax, ya+3.0*t_triax, False):
                        elem[j].layer = layer_list[4]  # layer_no = 4
                    elif middleCoordIsWithinBounds(elem[j], ya+3.0*t_triax, ya+4.0*t_triax, False):
                        elem[j].layer = layer_list[5]  # layer_no = 5
                    else:  # all y-coords >= ya+4.0*t_triax
                        elem[j].layer = layer_list[6]  # layer_no = 6
                        if not middleCoordIsWithinBounds(elem[j], ya+4.0*t_triax, h_sw/2.0, False):
                            print "WARNING: element # " + str(elem[j].elem_no) + " may have been assigned incorrect layer"
                else:
                    # bottom root buildup
                    elem[j].theta1 = 180.0
                    if middleCoordIsWithinBounds(elem[j], -ya-1.0*t_triax, -ya-0.0*t_triax, False):
                        elem[j].layer = layer_list[4]  # layer_no = 4
                    elif middleCoordIsWithinBounds(elem[j], -ya-2.0*t_triax, -ya-1.0*t_triax, False):
                        elem[j].layer = layer_list[5]  # layer_no = 5
                    elif middleCoordIsWithinBounds(elem[j], -ya-3.0*t_triax, -ya-2.0*t_triax, False):
                        elem[j].layer = layer_list[4]  # layer_no = 4
                    elif middleCoordIsWithinBounds(elem[j], -ya-4.0*t_triax, -ya-3.0*t_triax, False):
                        elem[j].layer = layer_list[5]  # layer_no = 5
                    else:  # all y-coords <= -ya-4.0*t_triax
                        elem[j].layer = layer_list[6]  # layer_no = 6
                        if not middleCoordIsWithinBounds(elem[j], -h_sw/2.0, -ya-4.0*t_triax, False):
                            print "WARNING: element # " + str(elem[j].elem_no) + " may have been assigned incorrect layer"
        
        # biaxial GFRP
        if middleCoordIsWithinBounds(elem[j], xa, xb, True):
            # right shear web, internal biaxial laminate
            elem[j].theta1 = 270.0
            if middleCoordIsWithinBounds(elem[j], xa+0.0*t_biax, xa+1.0*t_biax, True):
                elem[j].layer = layer_list[2]  # layer_no = 2
            elif middleCoordIsWithinBounds(elem[j], xa+1.0*t_biax, xa+2.0*t_biax, True):
                elem[j].layer = layer_list[3]  # layer_no = 3
            elif middleCoordIsWithinBounds(elem[j], xa+2.0*t_biax, xa+3.0*t_biax, True):
                elem[j].layer = layer_list[2]  # layer_no = 2
            elif middleCoordIsWithinBounds(elem[j], xa+3.0*t_biax, xa+4.0*t_biax, True):
                elem[j].layer = layer_list[3]  # layer_no = 3
            elif middleCoordIsWithinBounds(elem[j], xa+4.0*t_biax, xa+5.0*t_biax, True):
                elem[j].layer = layer_list[2]  # layer_no = 2
            elif middleCoordIsWithinBounds(elem[j], xa+5.0*t_biax, xa+6.0*t_biax, True):
                elem[j].layer = layer_list[3]  # layer_no = 3
            elif middleCoordIsWithinBounds(elem[j], xa+6.0*t_biax, xa+7.0*t_biax, True):
                elem[j].layer = layer_list[2]  # layer_no = 2
            elif middleCoordIsWithinBounds(elem[j], xa+7.0*t_biax, xb, True):
                elem[j].layer = layer_list[3]  # layer_no = 3
            else:
                print "WARNING: element # " + str(elem[j].elem_no) + " may have been assigned incorrect layer"
        elif middleCoordIsWithinBounds(elem[j], xc, xd, True):
            # right shear web, external biaxial laminate
            elem[j].theta1 = 270.0
            if middleCoordIsWithinBounds(elem[j], xc+0.0*t_biax, xc+1.0*t_biax, True):
                elem[j].layer = layer_list[2]  # layer_no = 2
            elif middleCoordIsWithinBounds(elem[j], xc+1.0*t_biax, xc+2.0*t_biax, True):
                elem[j].layer = layer_list[3]  # layer_no = 3
            elif middleCoordIsWithinBounds(elem[j], xc+2.0*t_biax, xc+3.0*t_biax, True):
                elem[j].layer = layer_list[2]  # layer_no = 2
            elif middleCoordIsWithinBounds(elem[j], xc+3.0*t_biax, xc+4.0*t_biax, True):
                elem[j].layer = layer_list[3]  # layer_no = 3
            elif middleCoordIsWithinBounds(elem[j], xc+4.0*t_biax, xc+5.0*t_biax, True):
                elem[j].layer = layer_list[2]  # layer_no = 2
            elif middleCoordIsWithinBounds(elem[j], xc+5.0*t_biax, xc+6.0*t_biax, True):
                elem[j].layer = layer_list[3]  # layer_no = 3
            elif middleCoordIsWithinBounds(elem[j], xc+6.0*t_biax, xc+7.0*t_biax, True):
                elem[j].layer = layer_list[2]  # layer_no = 2
            elif middleCoordIsWithinBounds(elem[j], xc+7.0*t_biax, xd, True):
                elem[j].layer = layer_list[3]  # layer_no = 3
            else:
                print "WARNING: element # " + str(elem[j].elem_no) + " may have been assigned incorrect layer"
        elif middleCoordIsWithinBounds(elem[j], -xb, -xa, True):
            # left shear web, internal biaxial laminate
            elem[j].theta1 = 90.0   
            if middleCoordIsWithinBounds(elem[j], -xa-1.0*t_biax, -xa-0.0*t_biax, True):
                elem[j].layer = layer_list[2]  # layer_no = 2
            elif middleCoordIsWithinBounds(elem[j], -xa-2.0*t_biax, -xa-1.0*t_biax, True):
                elem[j].layer = layer_list[3]  # layer_no = 3
            elif middleCoordIsWithinBounds(elem[j], -xa-3.0*t_biax, -xa-2.0*t_biax, True):
                elem[j].layer = layer_list[2]  # layer_no = 2
            elif middleCoordIsWithinBounds(elem[j], -xa-4.0*t_biax, -xa-3.0*t_biax, True):
                elem[j].layer = layer_list[3]  # layer_no = 3
            elif middleCoordIsWithinBounds(elem[j], -xa-5.0*t_biax, -xa-4.0*t_biax, True):
                elem[j].layer = layer_list[2]  # layer_no = 2
            elif middleCoordIsWithinBounds(elem[j], -xa-6.0*t_biax, -xa-5.0*t_biax, True):
                elem[j].layer = layer_list[3]  # layer_no = 3
            elif middleCoordIsWithinBounds(elem[j], -xa-7.0*t_biax, -xa-6.0*t_biax, True):
                elem[j].layer = layer_list[2]  # layer_no = 2
            elif middleCoordIsWithinBounds(elem[j], -xb, -xa-7.0*t_biax, True):
                elem[j].layer = layer_list[3]  # layer_no = 3
            else:
                print "WARNING: element # " + str(elem[j].elem_no) + " may have been assigned incorrect layer"
        elif middleCoordIsWithinBounds(elem[j], -xd, -xc, True):
            # left shear web, external biaxial laminate
            elem[j].theta1 = 90.0
            if middleCoordIsWithinBounds(elem[j], -xc-1.0*t_biax, -xc-0.0*t_biax, True):
                elem[j].layer = layer_list[2]  # layer_no = 2
            elif middleCoordIsWithinBounds(elem[j], -xc-2.0*t_biax, -xc-1.0*t_biax, True):
                elem[j].layer = layer_list[3]  # layer_no = 3
            elif middleCoordIsWithinBounds(elem[j], -xc-3.0*t_biax, -xc-2.0*t_biax, True):
                elem[j].layer = layer_list[2]  # layer_no = 2
            elif middleCoordIsWithinBounds(elem[j], -xc-4.0*t_biax, -xc-3.0*t_biax, True):
                elem[j].layer = layer_list[3]  # layer_no = 3
            elif middleCoordIsWithinBounds(elem[j], -xc-5.0*t_biax, -xc-4.0*t_biax, True):
                elem[j].layer = layer_list[2]  # layer_no = 2
            elif middleCoordIsWithinBounds(elem[j], -xc-6.0*t_biax, -xc-5.0*t_biax, True):
                elem[j].layer = layer_list[3]  # layer_no = 3
            elif middleCoordIsWithinBounds(elem[j], -xc-7.0*t_biax, -xc-6.0*t_biax, True):
                elem[j].layer = layer_list[2]  # layer_no = 2
            elif middleCoordIsWithinBounds(elem[j], -xd, -xc-7.0*t_biax, True):
                elem[j].layer = layer_list[3]  # layer_no = 3
            else:
                print "WARNING: element # " + str(elem[j].elem_no) + " may have been assigned incorrect layer"
        
        # foam
        if middleCoordIsWithinBounds(elem[j], xb, xc, True):
            # right shear web
            elem[j].layer = layer_list[7]  # layer_no = 7
            elem[j].theta1 = 270.0
        elif middleCoordIsWithinBounds(elem[j], -xc, -xb, True):
            # left shear web
            elem[j].layer = layer_list[7]  # layer_no = 7
            elem[j].theta1 = 90.0
        
    return