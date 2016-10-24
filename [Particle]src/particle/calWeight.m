function weights = calWeight(particleStates,blockWise,targetFeature_MV,sigma, nDirs,mag,max_mag,angle,back_feature)
% NOTE : x-axis is vertical in this case
% state = [ x, y, vx, vy, Hx, Hy, sc]
% [x,y] - centroid of the target
% [vx,vy] - velocities
% [Hx,Hy] - size of the target (for now a rectangle, maybe an ellispe in the future)
% sc - scaling factor

alpa = 0.5;
nParticles = size(particleStates,1);

mv_F       = zeros(nParticles,1);
mv_B       = zeros(nParticles,1);

parfor i = 1 : nParticles
    pState = particleStates(i,:);
    
    pFeature_B = get_MV_FF(mag,max_mag,angle, pState,blockWise,nDirs);
    
    mv_B(i) = mv_bhattadistance(pFeature_B, back_feature);
    mv_F(i) = mv_bhattadistance(pFeature_B, targetFeature_MV);
end

% mv_B =(1.00-mv_B)/5;
% weights = exp(-mv_d/(2*sigma));
% weights = exp(-mv_B/(2*sigma));
%  mv_B = mv_B /  max(mv_B);
%  mv_d = mv_d /  sum(mv_d);

mv_F = 1 - min(mv_F,1);
weights = exp(-((mv_B.^alpa).*(mv_F.^(1-alpa)))/(2*sigma));

for j = 1: 1001
        for i = 1 : 1001
        w(j,i) = exp(-((((i-1)/1000).^alpa).*(((j-1)/1000).^(1-alpa)))/(2*sigma));
    end
end
figure(10); 
contour3(0 : 0.001 : 1,0 : 0.001 : 1,w);
hold on;    
figure(10); scatter3(mv_B,mv_F,weights,'filled');
axis([0.0 1.0 0.0 1.0 0.0 1.0]); hold off;
weights = weights/sum(weights);

