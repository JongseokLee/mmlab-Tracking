% Modified by D.K Lee (dongkyu@media.kw.ac.kr)
%
%
% show the input image with MV info.
%
% input
%   img_RGB             input RGB image
%   MV_hor              horizontal component of motion vectors
%   MV_ver              vertical component of motion vectors		
%   numBlk_w            the number of blocks in width
%   numBlk_h			the number of blocks in height

function showMV(img_RGB, MV_hor, MV_ver, frameNum, numBlk_w, numBlk_h, blk_size)

fig_title = ['Frame ' num2str(frameNum)];
figure('Name', 'Motion Vectors'), imshow(img_RGB);
title(fig_title);
hold on;
quiver((1:numBlk_w)*blk_size,(1:numBlk_h)*blk_size,MV_hor*2,MV_ver*2,2,'color','y')


% mag_MV = sqrt(MV_hor.^2 + MV_ver.^2);
% fig_title = ['Frame ' num2str(frameNum)];
% figure('Name', 'Motion Vector Magnitude'), imagesc(mag_MV);
% title(fig_title);

end