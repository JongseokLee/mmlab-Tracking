clc, clear;
close all;

warning('off', 'MATLAB:MKDIR:DirectoryExists');
warning('off', 'images:initSize:adjustingMag');
addpath(genpath('[Particle]src'))
resultFolder      = '[Particle]Result';
resultFolder_Ivan = 'Result_Ivan'; 

%% Sequence Parameters
qp = 22;                %-Quantization Parameter 22, 27, 32, 37
blkSize = 1;            %-Block size for blockwise
seqs = InitParams(qp);  %-Sequence info.
Save_gt = 1;                 
Display_gt = 0;

% for seqIdx = 23 : size(seqs)
for seqIdx = 1 : 22
    %% INITIALIZATION
    seq = seqs{seqIdx};
    [startFrame, endFrame, inputPathes, imgPathes, img_w, img_h] = getSeqParams(seq);
    
    %-Size of blockwise-domain
    imgSize = [img_h, img_w];
    blk_w = img_w / blkSize; blk_h = img_h / blkSize;
    blockWise = [blk_h, blk_w];
    
    if  seqIdx > 6
        GT = load(['.\Dataset/' seq.seqName '/' 'groundtruth.txt']);
    end
    TotalFrameNum = endFrame - startFrame;
    
    CenterAll  = cell(1,TotalFrameNum);
    CornersAll = cell(1,TotalFrameNum);
    %% TRACKING
    %-Frame-level tracking
    fprintf('%3d.\t%s\tCreate GT mat Begin...\n',seqIdx, seq.seqName);   t_total = 0;
    for t = startFrame+1 : 1 : endFrame
        
        %% Input reading
        if  seqIdx < 7
            % manual selection
            initGT = imread(imgPathes.groundTruth{t});
            initGT = initGT(1:img_h,1:img_w,:);
            % complement if necessary
            initGT = double(initGT); ind1 = find(initGT == 1); ind2 = find(initGT == 0);
            
            if size(ind1,1) > size(ind2,1)
                initGT = ~initGT;
            end
            initGT = logical(initGT);
            
            %-Resize GroundTruth to be "blockwise" domain
            initGT = imresize(initGT, blockWise,'nearest');    % resize GroundTruth to be
            
            % set initial target state
            [rec] = getROI(initGT, 1, 0);
            
            %% RESULT
            %-Show estimated result to a image file
            rect = [rec(3) rec(1) rec(4)-rec(3) rec(2)-rec(1)];
            
            center =  [rect(1)+rect(3)/2 rect(2)+rect(4)/2];
            corners = [rect(1) rect(1)         rect(1)+rect(3) rect(1)+rect(3) rect(1);
                       rect(2) rect(2)+rect(4) rect(2)+rect(4) rect(2)         rect(2)];
            
            CenterAll{t - startFrame}  = center;
            CornersAll{t - startFrame} = corners;
            if Display_gt ==1
                figure(99);
                img = imread(imgPathes.img{t}); img = img(1:img_h,1:img_w,:);
                imshow(img);
                line( corners(1,:), corners(2,:),'Color',[1.0,0.0,0.0], 'LineWidth', 2.0);drawnow;
            end
        else
            X = GT(t,1:2:7);
            X(5) = X(1);
            Y = GT(t,2:2:8);
            Y(5) = Y(1);
            
            CenterAll {t-startFrame}  = [mean(X(1:4)) mean(Y(1:4))];
            CornersAll{t-startFrame}  = [X ; Y];
            if Display_gt ==1;
                figure(99);
                img = imread(imgPathes.img{t}); img = img(1:img_h,1:img_w,:);
                imshow(img);
                line( X, Y,'Color',[1.0,0.0,0.0], 'LineWidth', 2.0);drawnow;
            end
        end
        
    end
    if Save_gt ==1
        save(['..\Dataset/' seqs{seqIdx}.seqName '/' seqs{seqIdx}.seqName '_gt.mat'], 'CornersAll','CenterAll');
    end
    fprintf('%3d.\t%s\tCreate GT mat End\n\n', seqIdx, seq.seqName);
    
end


