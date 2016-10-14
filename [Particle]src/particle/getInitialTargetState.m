function [ targetState, rec ] = getInitialTargetState( seq, blockWise, flagMTI )

[startFrame, ~, ~, imgPathes, img_w, img_h] = getSeqParams(seq);

if flagMTI      % manual selection
            img = imread(imgPathes.img{startFrame});
            img = img(1:img_h,1:img_w,:);
            figure(1), imshow(img);
            height = imrect;
            pos = wait(height);
            pos = floor(pos);
            initGT = zeros(img_h, img_w);
            initGT(pos(2):pos(2)+pos(4), pos(1):pos(1)+pos(3), 1) = 1;
            close figure 1;
    
%     GT = load(['..\Dataset/' seq.seqName '/' 'groundtruth.txt']);
%     TL_x = min(GT(startFrame,1:2:7));
%     TL_y = min(GT(startFrame,2:2:8));
%     BR_x = max(GT(startFrame,1:2:7));
%     BR_y = max(GT(startFrame,2:2:8));
%     
%     GT_rect = [TL_x TL_y BR_x-TL_x BR_y-TL_y];
%     GT_rect = round(GT_rect);
%     initGT = zeros(img_h, img_w);
%     initGT(GT_rect(2):GT_rect(2)+GT_rect(4), GT_rect(1):GT_rect(1)+GT_rect(3), 1) = 1;
    
else
    initGT = imread(imgPathes.groundTruth{startFrame});
    initGT = initGT(1:img_h,1:img_w,:);
end

% complement if necessary
initGT = double(initGT); ind1 = find(initGT == 1); ind2 = find(initGT == 0);
if size(ind1,1) > size(ind2,1)
    initGT = ~initGT;
end
initGT = logical(initGT);

%-Resize GroundTruth to be "blockwise" domain
initGT = imresize(initGT, blockWise,'nearest');    % resize GroundTruth to be

% set initial target state
[rec ,t,~,l,~,width,height] = getROI(initGT, 1, 0);
% initGT(t:t+height , l:l+width) = 1; 
Hx = floor(height/2);
Hy = floor(width/2);
tx = t + Hx;
ty = l + Hy;

targetState = [tx ty 0 0 Hx Hy 1];