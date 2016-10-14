clc, clear;
close all;

warning('off', 'MATLAB:MKDIR:DirectoryExists');
warning('off', 'images:initSize:adjustingMag');
resultFolder = '..\[Particle]Result';
resultFolder_2015 = '..\Result';
resultFolder_Ivan = '..\Result_Ivan';
result_version = '/Mask_MV_complete_QP_';
%% Sequence Parameters
qp = 22;                 %-Quantization Parameter
blkSize = 1;            %-Block size for blockwise
seqs = InitParams(qp);  %-Sequence info.

%% Options
flagMTI   = 1;    % flag for the manual target initialization
testPlot  = 0;   % flog for test plot

for seqIdx = 7 : size(seqs)
    %% INITIALIZATION
    seq = seqs{seqIdx};
    [startFrame, endFrame, inputPathes, imgPathes, img_w, img_h] = getSeqParams(seq);
    
    %-Size of blockwise-domain
    imgSize = [img_h, img_w];
    blk_w = img_w / blkSize; blk_h = img_h / blkSize;
    blockWise = [blk_h, blk_w];
   
    folderPath      = [resultFolder '/' seqs{seqIdx}.seqName '/Mask_MV_complete_QP_' sprintf('%d',qp)]; mkdir(folderPath);
    folderPath_Ivan = [resultFolder_Ivan '/' seqs{seqIdx}.seqName '/Mask_MV_complete_QP_' sprintf('%d',qp)]; mkdir(folderPath_Ivan);
    
    result_path = [resultFolder '/' seqs{seqIdx}.seqName '/compare_MV_complete_QP_22']; mkdir(result_path);
    
    %% TRACKING
    %-Frame-level tracking
    fprintf('%3d.\t%s\tEvaluation Begin...\n',seqIdx, seq.seqName);   t_total = 0;

    TotalFrameNum = endFrame - startFrame-1;
    %% Groundtruth load
    gt = load(['..\Dataset/' seqs{seqIdx}.seqName '/' seqs{seqIdx}.seqName '_gt.mat']);

    gtCornersAll = gt.CornersAll;

    %% Proposed 2016 data load
    mat_2016 = load([resultFolder '/' seq.seqName result_version sprintf('%d',qp) '/' seq.seqName '_2016.mat']);
    
    CornersAll_2016 = mat_2016.CornersAll;

    %% Proposed 2015 data load
    mat_2015 = load([resultFolder_2015 '/' seq.seqName result_version sprintf('%d',qp) '/' seq.seqName '_2015.mat']);
    
    CornersAll_2015 = mat_2015.CornersAll;

    %% Ivan data load
    mat_Ivan = load([resultFolder_Ivan '/' seq.seqName result_version sprintf('%d',qp) '/' seq.seqName '_Ivan.mat']);
    
    CornersAll_Ivan = mat_Ivan.CornersAll;

    for t = startFrame+1 : endFrame    
        img = imread(imgPathes.img{t}); img = img(1:img_h,1:img_w,:);
        figure(999);
        imshow(img);
        title(['Result for Frame ' num2str(t)]);  drawnow;
        hold on;
        gt     = gtCornersAll{t-startFrame};
        Ivan   = CornersAll_Ivan{t-startFrame};
        kw2015 = CornersAll_2015{t-startFrame};
        kw2016 = CornersAll_2016{t-startFrame};
        
        line( gt(1,:),         gt(2,:),'Color',[0.0,0.0,0.0], 'LineWidth', 2.0);drawnow;
        line( Ivan(1,:),     Ivan(2,:),'Color',[0.0,0.0,1.0], 'LineWidth', 2.0);drawnow;
        line( kw2015(1,:), kw2015(2,:),'Color',[0.0,1.0,0.0], 'LineWidth', 2.0);drawnow;
        line( kw2016(1,:), kw2016(2,:),'Color',[1.0,0.0,0.0], 'LineWidth', 2.0);drawnow;
        hline  = line(NaN,NaN,'LineWidth',2,'LineStyle','-','Color',[1 0 0]);
        hline1 = line(NaN,NaN,'LineWidth',2,'LineStyle','-','Color',[0 1 0]);
        hline2 = line(NaN,NaN,'LineWidth',2,'LineStyle','-','Color',[0 0 1]);
        hline3 = line(NaN,NaN,'LineWidth',2,'LineStyle','-','Color',[0 0 0]);
        legend([hline hline1 hline2 hline3],'KW2016','KW2015','Ivan','Groundtruth');
        
        
        %% Write estimated result to a image file
        frm = getframe(gcf);
        [img_result] = frame2im(frm);
        imwrite(img_result, [result_path '/' sprintf('%04d',t) '.png'], 'png', 'BitDepth',8);
        
    end
    fprintf('%3d.\t%s\tEvaluation End\n\n', seqIdx, seq.seqName);
    break;
    % fprintf('%3d.\t%s\t Proposed Algorithm[CenterError = %f OverlapRate = %f SuccessRate = %f]\n\n', seqIdx, seq.seqName,mCenterError,mOverlapRate,mSuccessRate);
    % fprintf('%3d.\t%s\t Ivan     Algorithm[CenterError = %f OverlapRate = %f SuccessRate = %f]\n\n', seqIdx, seq.seqName,mCenterError_Ivan,mOverlapRate_Ivan,mSuccessRate_Ivan);
    
end


