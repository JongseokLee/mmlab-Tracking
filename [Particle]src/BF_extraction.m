function [ back_feature,targetFeature_MV, mag, max_mag,angle] = BF_extraction(targetState,temp_state,fmv,nDirs,blockWise)

mag = sqrt(fmv.ver.^2 + fmv.hor.^2);
angle = atan2(fmv.ver, fmv.hor );
angle(angle == pi) = -pi;
angle = angle+ pi;
max_mag = min(blockWise)/16;
mag(mag>max_mag) = max_mag;

back_feature = get_MV_BF(mag,max_mag,angle, temp_state, blockWise,nDirs);
fore_feature = get_MV_BF(mag,max_mag,angle, targetState,blockWise,nDirs);

back_feature =abs(back_feature - fore_feature);
back_feature(1:8) = back_feature(1:8)/(2*sum(back_feature(1:8)));
back_feature(9:16) = back_feature(9:16)/(2*sum(back_feature(9:16)));

targetFeature_MV = get_MV_FF(mag,max_mag,angle,targetState,blockWise,nDirs);
end