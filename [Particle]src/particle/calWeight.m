function weights = calWeight(particleStates,blockWise,targetFeature_MV,sigma, nDirs,mag,max_mag,angle,back_feature, alpa)
% NOTE : x-axis is vertical in this case
% state = [ x, y, vx, vy, Hx, Hy, sc]
% [x,y] - centroid of the target
% [vx,vy] - velocities
% [Hx,Hy] - size of the target (for now a rectangle, maybe an ellispe in the future)
% sc - scaling factor

% alpa = 0.9;
nParticles = size(particleStates,1);

mv_d       = zeros(nParticles,1);
mv_B       = zeros(nParticles,1);

parfor i = 1 : nParticles
    pState = particleStates(i,:);
    
    pFeature_B = get_MV_FF(mag,max_mag,angle, pState,blockWise,nDirs);
    
    mv_B(i) = mv_bhattadistance(pFeature_B, back_feature);
    mv_d(i) = mv_bhattadistance(pFeature_B, targetFeature_MV);
end

mv_B = sqrt(1.001-mv_B);
% weights = exp(-mv_d/(2*sigma));
% weights = exp(-mv_B/(2*sigma));
weights = exp(-((mv_B.^alpa).*(mv_d.^(1-alpa)))/(2*sigma));

weights = weights/sum(weights);

