%% SECTION TITLE
% DESCRIPTIVE TEXT
function [ pMvHist ] = getPMvHist( gmc_mv, targetState, nDirs, blockWise )

zeroDir = -pi - 2*pi/nDirs;

[~, t, b, l, r] = getRecState(targetState,blockWise);
%  x = targetState(2)-targetState(6);
%     if x < 1
%         x =1;
%     end
%     y = targetState(1)-targetState(5);
%     if y < 1
%         y = 1;
%     end
%     w = 2*targetState(6);
%     if x+w  > blockWise(2)
%         x =  blockWise(2)-w+1;    
%     end
%     h = 2*targetState(5);
%     if y+h  > blockWise(1)
%         y = blockWise(1)-h+1;    
%     end
%     
%      t = floor(y+1);
%      b = floor(y+h);
%      l = floor(x+1);
%      r = floor(x+w);
t = max(1,min(t,blockWise(1)));
b = max(1,min(b,blockWise(1)));
l = max(1,min(l,blockWise(2)));
r = max(1,min(r,blockWise(2)));
      
pMv.hor = gmc_mv.hor(t:b, l:r);
pMv.ver = gmc_mv.ver(t:b, l:r);

[rows, cols] = size(pMv.hor);

pMv.hor = reshape(pMv.hor, rows*cols,1);
pMv.ver = reshape(pMv.ver, rows*cols,1);

angle = atan2(pMv.ver, pMv.hor) ;
angle(angle == pi) = -pi;
% angle( pMv.hor == 0 &  pMv.ver == 0 ) = zeroDir;
angle( pMv.hor == 0 &  pMv.ver == 0 ) = pi;
angle_int = round(angle/(2*pi/nDirs)) + nDirs/2;
[nSamples] = histo_mv(angle_int,nDirs+2);

% [nSamples] = hist(angle, zeroDir:2*pi/nDirs:pi);
pMvHist = nSamples / sum(nSamples);


