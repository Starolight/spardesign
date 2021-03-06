%%%% DERIVED PARAMETERS, DIMENSIONAL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% convert station numbers into x1-coordinates stored in global_constants.m
jt_beg = x1(jt_beg_station);  % beginning of joint transition
jt_end = x1(jt_end_station);  % end of joint transition
if root_joint_flag
    rt_beg = x1(rt_beg_station); % beginning of root transition
    rt_end = x1(rt_end_station); % end of root transition
end

g = g__to__c * c_max;    % gap, [m]

% point = [x-coordinate, y-coordinate, z-coordinate, weight];
if root_joint_flag
    A = [0.0, 0.0, 0.0, 1.0];
    B = [rt_beg, 0.0, 0.0, 1.0];
    C = [rt_end, 0.0, g/2.0, 1.0];
    D = [jt_beg, 0.0, g/2.0, 1.0];
    E = [jt_end, 0.0, 0.0, 1.0];
    F = [R, 0.0, 0.0, 1.0];
    G = [rt_end, 0.0, -g/2.0, 1.0];
    H = [jt_beg, 0.0, -g/2.0, 1.0];
else
    C = [0.0,    0.0,  g/2.0, 1.0];
    D = [jt_beg, 0.0,  g/2.0, 1.0];
    E = [jt_end, 0.0,  0.0,   1.0];
    F = [R,      0.0,  0.0,   1.0];
    G = [0.0,    0.0, -g/2.0, 1.0];
    H = [jt_beg, 0.0, -g/2.0, 1.0];
end

if root_joint_flag
    r_r = B(1); % root length, [m]
    r_rt = C(1) - B(1); % root transition length, [m]
end
r_j = E(1);                  % joint length, [m]
r_jt = E(1) - D(1);          % joint transition length, [m]

fprintf('span:                    R    = %6.3f m \n', R);
fprintf('joint length:            r_j  = %6.3f m \n', r_j);
fprintf('joint transition length: r_jt = %6.3f m \n', r_jt);
if root_joint_flag
    fprintf('root transition length:  r_rt = %6.3f m \n', r_rt);
    fprintf('root length:             r_r  = %6.3f m \n', r_r);
end
fprintf('gap:                     g    = %6.3f m \n', g);
fprintf('maximum chord:           c    = %6.3f m \n', c_max);
fprintf('\n');


%%%% DERIVED PARAMETERS, NON-DIMENSIONAL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r_j__to__R    = r_j/R;     % joint length-to-span ratio
r_jt__to__r_j = r_jt/r_j;  % joint transition length-to-joint length ratio
if root_joint_flag
    r_rt__to__r_j = r_rt/r_j; % root transition length-to-joint length ratio
    r_r__to__r_j = r_r/r_j; % root length-to-joint length ratio
end

fprintf('joint length-to-span ratio:                    r_j/R    = %5.3f *\n', r_j__to__R);
fprintf('joint transition length-to-joint length ratio: r_jt/r_j = %5.3f \n', r_jt__to__r_j);
if root_joint_flag
    fprintf('root transition length-to-joint length ratio:  r_rt/r_j = %5.3f \n', r_rt__to__r_j);
    fprintf('root length-to-joint length ratio:             r_r/r_j  = %5.3f \n', r_r__to__r_j);
end
fprintf('gap-to-maximum chord ratio:                    g/c      = %5.3f *\n', g__to__c);


%%%% WRITE ENDPOINTS OF EACH REGION TO DYMORE-FORMATTED FILE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fid = fopen('.\input_files\biplane_spar_params.dgp', 'wt');
fprintf(fid, '@DESIGN_PARAMETERS_DEFINITION {\n');
if root_joint_flag
    fprintf(fid, '  @DESIGN_PARAMETER_NAME {#pointA_xyz}  @VECTOR_VALUE {%6.3f, %6.3f, %6.3f}\n', A(1:3));
    fprintf(fid, '  @DESIGN_PARAMETER_NAME {#pointB_xyz}  @VECTOR_VALUE {%6.3f, %6.3f, %6.3f}\n', B(1:3));
end
fprintf(fid, '  @DESIGN_PARAMETER_NAME {#pointC_xyz}  @VECTOR_VALUE {%6.3f, %6.3f, %6.3f}\n', C(1:3));
fprintf(fid, '  @DESIGN_PARAMETER_NAME {#pointD_xyz}  @VECTOR_VALUE {%6.3f, %6.3f, %6.3f}\n', D(1:3));
fprintf(fid, '  @DESIGN_PARAMETER_NAME {#pointE_xyz}  @VECTOR_VALUE {%6.3f, %6.3f, %6.3f}\n', E(1:3));
fprintf(fid, '  @DESIGN_PARAMETER_NAME {#pointF_xyz}  @VECTOR_VALUE {%6.3f, %6.3f, %6.3f}\n', F(1:3));
fprintf(fid, '  @DESIGN_PARAMETER_NAME {#pointG_xyz}  @VECTOR_VALUE {%6.3f, %6.3f, %6.3f}\n', G(1:3));
fprintf(fid, '  @DESIGN_PARAMETER_NAME {#pointH_xyz}  @VECTOR_VALUE {%6.3f, %6.3f, %6.3f}\n', H(1:3));
fprintf(fid, '}\n');
fclose(fid);