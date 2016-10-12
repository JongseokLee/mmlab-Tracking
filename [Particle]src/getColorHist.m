function [ ColorHist ] = getColorHist(YUV, targetState, blockWise, nbin)
[~, t, b, l, r] = getRecState(targetState,blockWise);
% x = targetState(2)-targetState(6);
%     if x < 1
%         x =1;
%     end
%     y = targetState(1)-targetState(5);
%     if y < 1
%         y = 1;
%     end
%     w = 2*targetState(6)+1;
%     if x+w  > blockWise(2)
%         x =  blockWise(2)-w;    
%     end
%     h = 2*targetState(5)+1;
%     if y+h  > blockWise(1)
%         y = blockWise(1)-h;    
%     end
%     
%     t = y;
%     b = y+h;
%     l = x;
%     r = x+w;
    
roiYUV = YUV(t:b, l:r, :);
ColorHist = histo( roiYUV, nbin );
% ColorHist = hist( roiYUV, nbin );
% 
% [rows, cols, dem] = size(roiYUV);
% 
% roiYUV = reshape(roiYUV, rows*cols,1,dem);
% 
% roiYUV = floor((roiYUV+1)/(256/nbin));
% 
% [nSamples.Y] = hist(roiYUV(:,:,1), 1:1:nbin);
% [nSamples.U] = hist(roiYUV(:,:,2), 1:1:nbin);
% [nSamples.V] = hist(roiYUV(:,:,2), 1:1:nbin);
% 
% ColorHist.Y = nSamples.Y / sum(nSamples.Y);
% ColorHist.U = nSamples.U / sum(nSamples.U);
% ColorHist.V = nSamples.V / sum(nSamples.V);




