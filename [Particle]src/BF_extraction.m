function [ back_feature, mag, max_mag,angle] = BF_extraction(targetState,fmv,est_motion,B_AREA_RATIO,nDirs,blockWise)

mag = sqrt(fmv.ver.^2 + fmv.hor.^2);
angle = atan2(fmv.ver, fmv.hor );
angle(angle == pi) = -pi;
angle = angle+ pi;
max_mag = max(max(mag));

targetState(1) = targetState(1) - est_motion.ver;
targetState(2) = targetState(2) - est_motion.hor;

temp_state = targetState;

temp_state(5) = temp_state(5)*B_AREA_RATIO;
temp_state(6) = temp_state(6)*B_AREA_RATIO;

temp_state(5) = sqrt(temp_state(5)*temp_state(6));
temp_state(6) = sqrt(temp_state(5)*temp_state(6));

temp_state = round(temp_state);

back_feature = get_MV_BF(mag,max_mag,angle, temp_state,blockWise,nDirs);