import truegrid.read_layup as rl
import DYMORE.DYMOREutilities as du


def writeBeamPropertyDefinition(fName, spar_stn_list, layup_data, beam_property_name, property_definition_type, coordinate_type, comments, read_layup_eta=True, print_flag=False):
    """
    Write the DYMORE-formatted @BEAM_PROPERTY_DEFINITION code block to a file.

    Parameters
    ----------
    fName : <string>
        A filename. The beam property definition code block will be saved here.
    spar_stn_list : <list of ints>
        A list of stations whose properties will be included in this code block.
    layup_data : <np.array>
        An array of cross-sectional data for the entire spar.
        This data has been obtained from a layup file.
        (See truegrid.read_layup.readLayupFile(...))
    beam_property_name : <string>
        The label associated with this beam property definition.
    property_definition_type : <string>
        The format of the properties.
        Acceptable values are: 'SECTIONAL_PROPERTIES',
                               '6X6_MATRICES', or
                               'PROPERTY_TABLES' 
    coordinate_type : <string>
        The format of coordinates along the span of the beam.
        Acceptable values are: 'ETA_COORDINATE',
                               'CURVILINEAR_COORDINATE' (not yet supported), or
                               'AXIAL_COORDINATE' (not yet supported)
    comments : <string>
        The user-defined comment associated with this code block.
    read_layup_eta : <logical>
        Set to False to use local eta values from a subset of spar stations.
        (See truegrid.read_layup_sparStns_to_eta(...))
    print_flag : <logical>
        Set to True to print debugging information to the screen.

    Returns
    -------
    <none> (However, a file is written to hard disk.)
    """

    dymoreMKfile = du.makeFile(dymore_MKblock_filename)

    tab = '  '

    # write the header for the beam property definition
    dymoreMKfile.write('@BEAM_PROPERTY_DEFINITION {\n')
    dymoreMKfile.write(tab*1 + '@BEAM_PROPERTY_NAME {' + beam_property_name + '} {\n')
    dymoreMKfile.write(tab*2 +   '@PROPERTY_DEFINITION_TYPE {' + property_definition_type + '}\n')
    dymoreMKfile.write(tab*2 +   '@COORDINATE_TYPE {' + coordinate_type + '}\n')
    dymoreMKfile.write(tab*2 +   '\n')

    if not read_layup_eta:
        (eta, x1) = rl.sparStns_to_eta(layup_data, spar_stn_list[0], spar_stn_list[-1], pretty_print=print_flag)

    # write the mass and stiffness matrices for the beam property definition
    for n in range(len(spar_stn_list)):
        spar_station = spar_stn_list[n]
        if spar_station < 10:
            basefilestr = 'spar_station_0' + str(spar_station)
        else:
            basefilestr = 'spar_station_' + str(spar_station)

        if print_flag:
            print ''
            print '***************'
            print basefilestr
            print '***************'

        # ----------------------------------------------------------------------------------

        stationData = rl.extractStationData(layup_data,spar_station)
        if stationData['spar station'] < 10:
            sparstnstr = '0' + str(stationData['spar station'])
        else:
            sparstnstr = str(stationData['spar station'])
        vabsMK = 'VABS/M_and_K_matrices/spar_station_' + sparstnstr + '.dat.K'
        if not read_layup_eta:
            stationData['eta'] = eta[n]
        du.writeMKmatrices(dymoreMKfile, vabsMK, stationData, CoordType=coordinate_type, debug_flag=False)

    # Format the comments for a Dymore code block. Maximum comment length is 5 lines of 120 characters each
    comments = du.formatComments(comments)

    # write the footer for the beam property definition
    dymoreMKfile.write(tab*2 + '@COMMENTS {' + comments + '}\n')
    dymoreMKfile.write(tab*1 + '}\n')
    dymoreMKfile.write('}\n')

    # close the file, which now contains the complete beam property defintion
    dymoreMKfile.close()

    return


def writeOrientationDistributionDefinition(fName, spar_stn_list, layup_data, orientation_distribution_name, orientation_definition_type, coordinate_type, comments, untwisted=False, read_layup_eta=True, print_flag=False):
    """
    Write the DYMORE-formatted @ORIENTATION_DISTRIBUTION_DEFINITION code block.

    Parameters
    ----------
    fName : <string>
        A filename. The beam property definition code block will be saved here.
    spar_stn_list : <list of ints>
        A list of stations whose properties will be included in this code block.
    layup_data : <np.array>
        An array of cross-sectional data for the entire spar.
        This data has been obtained from a layup file.
        (See truegrid.read_layup.readLayupFile(...))    
    orientation_distribution_name : <string>
        The label associated with this orientation distribution definition.
    orientation_definition_type : <string>
        The format of the orientation triads.
        Acceptable values are: 'TWIST_ANGLE',
                               'VECTORS_E2_E3' (not yet supported), or
                               'EULER_ANGLES_313' (not yet supported), or
                               'EULER_ANGLES_323' (not yet supported), or
                               'EULER_ANGLES_321' (not yet supported), or
                               'EULER_ANGLES_312' (not yet supported)
    coordinate_type : <string>
        The format of coordinates along the span of the beam.
        Acceptable values are: 'ETA_COORDINATE',
                               'CURVILINEAR_COORDINATE' (not yet supported), or
                               'AXIAL_COORDINATE' (not yet supported)
    comments : <string>
        The user-defined comment associated with this code block.
    untwisted : <logical>
        Set to True to force all TWIST_ANGLE entries to be zero.
    read_layup_eta : <logical>
        Set to False to use local eta values from a subset of spar stations.
        (See truegrid.read_layup_sparStns_to_eta(...))
    print_flag : <logical>
        Set to True to print debugging information to the screen.

    Returns
    -------
    <none> (However, a file is written to hard disk.)

    Example output
    --------------
    @ORIENTATION_DISTRIBUTION_DEFINITION {
      @ORIENTATION_DISTRIBUTION_NAME { orientationSpar } {
        @ORIENTATION_DEFINITION_TYPE { TWIST_ANGLE }
        @COORDINATE_TYPE { ETA_COORDINATE }

        @ETA_COORDINATE {0.00000e+00} 
        @TWIST_ANGLE {12.1}

        @ETA_COORDINATE {2.17628e-03}
        @TWIST_ANGLE {10.5}
        
        ...

        @COMMENTS{CommentText}
      }
    }
    """

    dymoreOrientationFile = du.makeFile(fName)

    tab = '  '

    # write the header for the orientation distribution definition
    dymoreOrientationFile.write('@ORIENTATION_DISTRIBUTION_DEFINITION {\n')
    dymoreOrientationFile.write(tab*1 + '@ORIENTATION_DISTRIBUTION_NAME {' + orientation_distribution_name + '} {\n')
    dymoreOrientationFile.write(tab*2 +   '@ORIENTATION_DEFINITION_TYPE {' + orientation_definition_type + '}\n')
    dymoreOrientationFile.write(tab*2 +   '@COORDINATE_TYPE {' + coordinate_type + '}\n')
    dymoreOrientationFile.write(tab*2 +   '\n')

    if not read_layup_eta:
        (eta, x1) = rl.sparStns_to_eta(layup_data, spar_stn_list[0], spar_stn_list[-1], pretty_print=print_flag)

    # write the eta and twist values for the orientation distribution definition
    for n in range(len(spar_stn_list)):
        spar_station = spar_stn_list[n]
        if spar_station < 10:
            basefilestr = 'spar_station_0' + str(spar_station)
        else:
            basefilestr = 'spar_station_' + str(spar_station)

        if print_flag:
            print ''
            print '***************'
            print basefilestr
            print '***************'

        # ----------------------------------------------------------------------------------

        stationData = rl.extractStationData(layup_data,spar_station)
        if stationData['spar station'] < 10:
            sparstnstr = '0' + str(stationData['spar station'])
        else:
            sparstnstr = str(stationData['spar station'])

        if coordinate_type == 'ETA_COORDINATE':
            if read_layup_eta:
                coord = stationData['eta']
            else:
                coord = eta[n]
            dymoreOrientationFile.write(tab*2 + '@ETA_COORDINATE {' + ('%11.5e' % coord) + '}\n')
        elif coordinate_type == 'CURVILINEAR_COORDINATE':
            # f.write(tab*2 + '@CURVILINEAR_COORDINATE {' + ('%11.5e' % coord) + '}\n')
            print "***WARNING*** CURVILINEAR_COORDINATE feature is not yet supported."
        elif coordinate_type == 'AXIAL_COORDINATE':
            # dymoreOrientationFile.write(tab*2 + '@AXIAL_COORDINATE {' + ('%11.5e' % stationData['x1']) + '}\n')
            print "***WARNING*** AXIAL_COORDINATE feature is not yet supported."

        if untwisted:
            tw = 0.0
        else:
            tw = stationData['twist degrees']
        dymoreOrientationFile.write(tab*2 + '@TWIST_ANGLE {' + ('%11.5e' % tw) + '}\n')
        dymoreOrientationFile.write(tab*2 + '\n')

    # Format the comments for a Dymore code block. Maximum comment length is 5 lines of 120 characters each
    comments = du.formatComments(comments)

    # write the footer for the orientation distribution definition
    dymoreOrientationFile.write(tab*2 + '@COMMENTS {' + comments + '}\n')
    dymoreOrientationFile.write(tab*1 + '}\n')
    dymoreOrientationFile.write('}\n')

    # close the file, which now contains the complete orientation distribution defintion
    dymoreOrientationFile.close()

if __name__ == '__main__':  #run this code if called directly from the command line (good for debugging)
    # ----------------------------------------------------------------------------------
    # set parameters for DYMORE code blocks
    # -------------------------------------
    layup_file_data = rl.readLayupFile('truegrid/biplane_spar_layup_20120306.txt')
    # spar_stn_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]  # generate a DYMORE code block for these spar stations
    spar_stn_list = [14, 15, 16]  # generate a DYMORE code block for these spar stations

    beam_property_name = 'propHE'
    BPD_comments = 'beam properties for spar stations 14-16'
    orientation_distribution_name = 'OriDistHE'
    ODD_comments = 'eta coordinates for spar stations 14-16'


    # ----------------------------------------------------------------------------------
    # BEAM PROPERTY DEFINITION
    # ------------------------

    # the beam property definition code block will be saved to this filename:
    dymore_MKblock_filename = 'dymoreMKblock.dat'

    # define settings for the beam property definition
    property_definition_type = '6X6_MATRICES'
    coordinate_type = 'ETA_COORDINATE'

    writeBeamPropertyDefinition(dymore_MKblock_filename, spar_stn_list, layup_file_data, beam_property_name, property_definition_type, coordinate_type, BPD_comments, read_layup_eta=False, print_flag=False)

    # ----------------------------------------------------------------------------------
    # ORIENTATION DISTRIBUTION DEFINITION
    # -----------------------------------

    # the orientation distribution definition code block will be saved to this filename:
    dymore_orientationblock_filename = 'dymoreOrientationBlock.dat'

    # define settings for the orientation distribution definition
    orientation_definition_type = 'TWIST_ANGLE'
    # coordinate_type = 'ETA_COORDINATE'   ## this is already defined above by the beam property definition ##
    untwisted_flag = True

    writeOrientationDistributionDefinition(dymore_orientationblock_filename, spar_stn_list, layup_file_data, orientation_distribution_name, orientation_definition_type, coordinate_type, ODD_comments, untwisted=untwisted_flag, read_layup_eta=False, print_flag=True)