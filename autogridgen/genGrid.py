import numpy as np
import matplotlib.pyplot as plt
import read_layup as rl
import cartGrid as cg
import time
# import elapsed_time as et
# import VABSobjects as vo
import plotgrid as pg
import elementMap as em
from mayavi import mlab
import gridViz as gv

# record the time when the code starts
start_time = time.time()

fastflag = False   # set to True to speed up this script



if fastflag:
	plotflag = False   # set to False to suppress plot output and speed up this script
else:
	plotflag = True

# import the data from the layup file
data = rl.readLayupFile('monoplane_spar_layup.txt')

if fastflag:
	endrange = 2                   # run for the first cross-section only
else:
	# endrange = 3
	endrange = len(data)+1         # run for all cross-sections

for i in range(1,endrange):
# for i in range(1,2):             # run for the first cross-section only
# for i in range(1,len(data)+1):   # run for all cross-sections
	spar_stn = i
	print "calculating grids for spar station", spar_stn, "..."
	# nelem = 0  # initialize the number of elements (cells) to zero
	# nrows = 5
	# ncols = 10
	maxAR = 1.2   # set the maximum aspect ratio for any given cell

	## set number of plies for each structural component ##
	SC_plies = 2       # spar cap has 2 plies:                      [0]_2
	RB_plies = 6       # root buildup has 6 plies:                  [+/-45]_2 [0]_2
	SW_biax_plies = 8  # biaxial laminate in shear web has 8 plies: [+/-45]_4
	SW_foam_plies = 4  # set the foam part of the shear web to use 4 cells across its thickness (the foam doesn't really have plies)

	## create a new figure for each cross-section, and define the max&min plot limits in the x&y directions
	# plt.figure(i)
	# pg.setPlotLabelsTitleAndGrid("spar station #" + str(i))
	# # plt.axes().set_xlim(-2,2)
	# # plt.axes().set_ylim(-3,3)
	# pg.setxyMaxMin(-2,2,-3,3)
	# pg.setPlotAspectRatioEqual()
	figtitle = "spar station #" + str(i)
	fig = mlab.figure(figure=figtitle, size=(600,750))  # make a new mayavi scene (figure window)
	mlab.view(0,0)


	### ROOT BUILDUP ###
	print "ROOT BUILDUP"
	### read in the columns for root buildup base & root buildup height
	rtbldup_bse = rl.extractDataColumn(data,'root buildup base')
	rtbldup_ht  = rl.extractDataColumn(data,'root buildup height')
	if rtbldup_bse[i-1] * rtbldup_ht[i-1] > 0.0:  # only perform operations for root buildup if its cross-sectional area is non-zero
		RB_corners = rl.extract_RB_corners(data,spar_stn)
		## top root buildup ##
		(dimH,dimV) = cg.calcCornerDims(RB_corners[0,:,:])
		(nV,nH) = cg.calcCellNums(dimV,RB_plies,maxAR,dimH)
		(nrows,ncols) = (nV,nH)
		# RB_T_gridpts = cg.storeGridPoints(nrows,ncols,RB_corners[0,:,:])
		(RB_T_gridpts,RB_T_nodes,RB_T_elements,RB_T_number_of_nodes,RB_T_number_of_elements,RB_T_elementMap,RB_T_x,RB_T_y) = cg.storeGridPoints2(nrows,ncols,RB_corners[0,:,:])
		## bottom root buildup ##
		(dimH,dimV) = cg.calcCornerDims(RB_corners[1,:,:])
		(nV,nH) = cg.calcCellNums(dimV,RB_plies,maxAR,dimH)
		(nrows,ncols) = (nV,nH)
		# RB_B_gridpts = cg.storeGridPoints(nrows,ncols,RB_corners[1,:,:])
		(RB_B_gridpts,RB_B_nodes,RB_B_elements,RB_B_number_of_nodes,RB_B_number_of_elements,RB_B_elementMap,RB_B_x,RB_B_y) = cg.storeGridPoints2(nrows,ncols,RB_corners[1,:,:])
		## plot both root buildups ##
		if (plotflag):
			# cg.plotGridPoints(RB_T_gridpts, RB_corners[0,:,:])
			# cg.plotGridPoints(RB_B_gridpts, RB_corners[1,:,:])
			# pg.plotNodesConnected(RB_T_number_of_elements, RB_T_elements)
			# pg.plotNodesConnected(RB_B_number_of_elements, RB_B_elements)
			# em.plotGridLines(RB_T_elementMap,RB_T_nodes)
			# em.plotGridLines(RB_B_elementMap,RB_B_nodes)
			# RB_T_grid = gv.generate_VABSgrid(RB_T_x,RB_T_y)
			# RB_B_grid = gv.generate_VABSgrid(RB_B_x,RB_B_y)
			# gv.view(RB_T_grid)
			# gv.view(RB_B_grid)
			gv.plotVABSgrid(RB_T_x,RB_T_y)
			gv.plotVABSgrid(RB_B_x,RB_B_y)


	### SPAR CAPS ###
	print "SPAR CAPS"
	SC_corners = rl.extract_SC_corners(data,spar_stn)
	## top spar cap ##
	(dimH,dimV) = cg.calcCornerDims(SC_corners[0,:,:])
	(nV,nH) = cg.calcCellNums(dimV,SC_plies,maxAR,dimH)
	(nrows,ncols) = (nV,nH)
	# SC_T_gridpts = cg.storeGridPoints(nrows,ncols,SC_corners[0,:,:])
	(SC_T_gridpts,SC_T_nodes,SC_T_elements,SC_T_number_of_nodes,SC_T_number_of_elements,SC_T_elementMap,SC_T_x,SC_T_y) = cg.storeGridPoints2(nrows,ncols,SC_corners[0,:,:])
	## bottom spar cap ##
	(dimH,dimV) = cg.calcCornerDims(SC_corners[1,:,:])
	(nV,nH) = cg.calcCellNums(dimV,SC_plies,maxAR,dimH)
	(nrows,ncols) = (nV,nH)
	# SC_B_gridpts = cg.storeGridPoints(nrows,ncols,SC_corners[1,:,:])
	(SC_B_gridpts,SC_B_nodes,SC_B_elements,SC_B_number_of_nodes,SC_B_number_of_elements,SC_B_elementMap,SC_B_x,SC_B_y) = cg.storeGridPoints2(nrows,ncols,SC_corners[1,:,:])
	## plot both spar caps ##
	if (plotflag):
		# cg.plotGridPoints(SC_T_gridpts, SC_corners[0,:,:])
		# cg.plotGridPoints(SC_B_gridpts, SC_corners[1,:,:])
		# pg.plotNodesConnected(SC_T_number_of_elements, SC_T_elements)
		# pg.plotNodesConnected(SC_B_number_of_elements, SC_B_elements)
		# em.plotGridLines(SC_T_elementMap,SC_T_nodes)
		# em.plotGridLines(SC_B_elementMap,SC_B_nodes)
		gv.plotVABSgrid(SC_T_x,SC_T_y)
		gv.plotVABSgrid(SC_B_x,SC_B_y)


	### SHEAR WEBS ###
	print "SHEAR WEBS"
	SW_corners = rl.extract_SW_corners(data,spar_stn)
	## left shear web ##
	# left biax laminate #
	(dimH,dimV) = cg.calcCornerDims(SW_corners[0,0,:,:])
	(nH,nV) = cg.calcCellNums(dimH,SW_biax_plies,maxAR,dimV)
	(nrows,ncols) = (nV,nH)
	# SW_L_biaxL_gridpts = cg.storeGridPoints(nrows,ncols,SW_corners[0,0,:,:])
	(SW_L_biaxL_gridpts,SW_L_biaxL_nodes,SW_L_biaxL_elements,SW_L_biaxL_number_of_nodes,SW_L_biaxL_number_of_elements,SW_L_biaxL_elementMap,SW_L_biaxL_x,SW_L_biaxL_y) = cg.storeGridPoints2(nrows,ncols,SW_corners[0,0,:,:])

	# foam laminate #
	(dimH,dimV) = cg.calcCornerDims(SW_corners[0,1,:,:])
	(nH,nV) = cg.calcCellNums(dimH,SW_foam_plies,maxAR,dimV)
	(nrows,ncols) = (nV,nH)
	# SW_L_foam_gridpts = cg.storeGridPoints(nrows,ncols,SW_corners[0,1,:,:])
	(SW_L_foam_gridpts,SW_L_foam_nodes,SW_L_foam_elements,SW_L_foam_number_of_nodes,SW_L_foam_number_of_elements,SW_L_foam_elementMap,SW_L_foam_x,SW_L_foam_y) = cg.storeGridPoints2(nrows,ncols,SW_corners[0,1,:,:])

	# right biax laminate #
	(dimH,dimV) = cg.calcCornerDims(SW_corners[0,2,:,:])
	(nH,nV) = cg.calcCellNums(dimH,SW_biax_plies,maxAR,dimV)
	(nrows,ncols) = (nV,nH)
	# SW_L_biaxR_gridpts = cg.storeGridPoints(nrows,ncols,SW_corners[0,2,:,:])
	(SW_L_biaxR_gridpts,SW_L_biaxR_nodes,SW_L_biaxR_elements,SW_L_biaxR_number_of_nodes,SW_L_biaxR_number_of_elements,SW_L_biaxR_elementMap,SW_L_biaxR_x,SW_L_biaxR_y) = cg.storeGridPoints2(nrows,ncols,SW_corners[0,2,:,:])

	## right shear web ##
	# left biax laminate #
	(dimH,dimV) = cg.calcCornerDims(SW_corners[1,0,:,:])
	(nH,nV) = cg.calcCellNums(dimH,SW_biax_plies,maxAR,dimV)
	(nrows,ncols) = (nV,nH)
	# SW_R_biaxL_gridpts = cg.storeGridPoints(nrows,ncols,SW_corners[1,0,:,:])
	(SW_R_biaxL_gridpts,SW_R_biaxL_nodes,SW_R_biaxL_elements,SW_R_biaxL_number_of_nodes,SW_R_biaxL_number_of_elements,SW_R_biaxL_elementMap,SW_R_biaxL_x,SW_R_biaxL_y) = cg.storeGridPoints2(nrows,ncols,SW_corners[1,0,:,:])

	# foam laminate #
	(dimH,dimV) = cg.calcCornerDims(SW_corners[1,1,:,:])
	(nH,nV) = cg.calcCellNums(dimH,SW_foam_plies,maxAR,dimV)
	(nrows,ncols) = (nV,nH)
	# SW_R_foam_gridpts = cg.storeGridPoints(nrows,ncols,SW_corners[1,1,:,:])
	(SW_R_foam_gridpts,SW_R_foam_nodes,SW_R_foam_elements,SW_R_foam_number_of_nodes,SW_R_foam_number_of_elements,SW_R_foam_elementMap,SW_R_foam_x,SW_R_foam_y) = cg.storeGridPoints2(nrows,ncols,SW_corners[1,1,:,:])

	# right biax laminate #
	(dimH,dimV) = cg.calcCornerDims(SW_corners[1,2,:,:])
	(nH,nV) = cg.calcCellNums(dimH,SW_biax_plies,maxAR,dimV)
	(nrows,ncols) = (nV,nH)
	# SW_R_biaxR_gridpts = cg.storeGridPoints(nrows,ncols,SW_corners[1,2,:,:])
	(SW_R_biaxR_gridpts,SW_R_biaxR_nodes,SW_R_biaxR_elements,SW_R_biaxR_number_of_nodes,SW_R_biaxR_number_of_elements,SW_R_biaxR_elementMap,SW_R_biaxR_x,SW_R_biaxR_y) = cg.storeGridPoints2(nrows,ncols,SW_corners[1,2,:,:])


	## plot both shear webs (all laminates) ##
	if (plotflag):
		# cg.plotGridPoints(SW_L_biaxL_gridpts, SW_corners[0,0,:,:])
		# cg.plotGridPoints(SW_L_foam_gridpts, SW_corners[0,1,:,:])
		# cg.plotGridPoints(SW_L_biaxR_gridpts, SW_corners[0,2,:,:])
		# cg.plotGridPoints(SW_R_biaxL_gridpts, SW_corners[1,0,:,:])
		# cg.plotGridPoints(SW_R_foam_gridpts, SW_corners[1,1,:,:])
		# cg.plotGridPoints(SW_R_biaxR_gridpts, SW_corners[1,2,:,:])
		# pg.plotNodesConnected(SW_L_biaxL_number_of_elements, SW_L_biaxL_elements)
		# pg.plotNodesConnected(SW_L_foam_number_of_elements, SW_L_foam_elements)
		# pg.plotNodesConnected(SW_L_biaxR_number_of_elements, SW_L_biaxR_elements)
		# pg.plotNodesConnected(SW_R_biaxL_number_of_elements, SW_R_biaxL_elements)
		# pg.plotNodesConnected(SW_R_foam_number_of_elements, SW_R_foam_elements)
		# pg.plotNodesConnected(SW_R_biaxR_number_of_elements, SW_R_biaxR_elements)
		print "* left shear web"
		print "** left biax"
		# em.plotGridLines(SW_L_biaxL_elementMap,SW_L_biaxL_nodes)
		gv.plotVABSgrid(SW_L_biaxL_x,SW_L_biaxL_y)
		print "** foam"
		# em.plotGridLines(SW_L_foam_elementMap,SW_L_foam_nodes)
		gv.plotVABSgrid(SW_L_foam_x,SW_L_foam_y)
		print "** right biax"
		# em.plotGridLines(SW_L_biaxR_elementMap,SW_L_biaxR_nodes)
		gv.plotVABSgrid(SW_L_biaxR_x,SW_L_biaxR_y)
		print "* right shear web"
		print "** left biax"
		# em.plotGridLines(SW_R_biaxL_elementMap,SW_R_biaxL_nodes)
		gv.plotVABSgrid(SW_R_biaxL_x,SW_R_biaxL_y)
		print "** foam"
		# em.plotGridLines(SW_R_foam_elementMap,SW_R_foam_nodes)
		gv.plotVABSgrid(SW_R_foam_x,SW_R_foam_y)
		print "** right biax"
		# em.plotGridLines(SW_R_biaxR_elementMap,SW_R_biaxR_nodes)
		gv.plotVABSgrid(SW_R_biaxR_x,SW_R_biaxR_y)

# plt.show()
## plot a test grid in mayavi
# rect = gv.generate_VABSgrid(RB_B_x,RB_B_y)
# fig = mlab.figure(figure='test grid', size=(600,750))  # make a new mayavi scene (figure window)
# gv.view(rect)
# mlab.view(0,0)


# calculate the time it took to run the code
elapsed_time_tot = time.time() - start_time

print "program completed in", ("%.2f" % round(elapsed_time_tot,2)), "seconds"
# print et.elapsed_time(elapsed_time_tot)


##### remove gridpts output from all cg.storeGridPoints2 function calls #####