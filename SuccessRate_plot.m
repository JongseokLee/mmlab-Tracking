clc, clear;
close all;

warning('off', 'MATLAB:MKDIR:DirectoryExists');
warning('off', 'images:initSize:adjustingMag');
addpath(genpath('[Particle]src'))
resultFolder      = '..\[Particle]Result';
resultFolder_2015 = '..\Result';
resultFolder_Ivan = '..\Result_Ivan';

result_version = '/Mask_MV_complete_QP_';
%% Sequence Parameters
qp = 22;                %-Quantization Parameter
blkSize = 1;            %-Block size for blockwise
seqs = InitParams(qp);  %-Sequence info.


% for seqIdx = 23 : size(seqs)
for seqIdx = 1: size(seqs)

    
    %% INITIALIZATION
    seq = seqs{seqIdx};
    [startFrame, endFrame] = getSeqParams(seq);
    fprintf('%3d.\t%s\t SuccessRate ploting begin...\n\n', seqIdx, seq.seqName);
    

    TotalFrameNum = endFrame - startFrame-1;
    %% Groundtruth load
    gt = load(['..\Dataset/' seqs{seqIdx}.seqName '/' seqs{seqIdx}.seqName '_gt.mat']);

    gtCornersAll = gt.CornersAll;
    gtCenterAll  = gt.CenterAll;
    
    %% Proposed 2016 data load
    mat_2016 = load([resultFolder '/' seq.seqName result_version sprintf('%d',qp) '/' seq.seqName '_2016.mat']);
    
    CornersAll_2016 = mat_2016.CornersAll;
    CenterAll_2016  = mat_2016.CenterAll;
    %% Proposed 2015 data load
    mat_2015 = load([resultFolder_2015 '/' seq.seqName result_version sprintf('%d',qp) '/' seq.seqName '_2015.mat']);
    
    CornersAll_2015 = mat_2015.CornersAll;
    CenterAll_2015  = mat_2015.CenterAll;
    %% Ivan data load
    mat_Ivan = load([resultFolder_Ivan '/' seq.seqName result_version sprintf('%d',qp) '/' seq.seqName '_Ivan.mat']);
    
    CornersAll_Ivan = mat_Ivan.CornersAll;
    CenterAll_Ivan  = mat_Ivan.CenterAll;
    
    
    %% Calculate Rate Proposed 2016
    [ centerError ] = centerErrorEvaluation(CenterAll_2016,  gtCenterAll);
    mCenterError = mean_no_nan(centerError);
    
    [ overlapRate ] = overlapEvaluationQuad(CornersAll_2016, gtCornersAll);
    mOverlapRate = mean_no_nan(overlapRate);
    
    for f = 1 : 1 : 101
        mSuccessRate(f)     = sum(overlapRate      > (f-1)/100 )/length(overlapRate);
    end
    
      for f = 1 : 1 : 51
        mPrecisionRate(f)= sum(centerError < f-1)/length(centerError);
    end
    
    
    %% Calculate Rate Proposed 2016
    [ centerError_2015 ] = centerErrorEvaluation(CenterAll_2015,  gtCenterAll);
    mCenterError_2015 = mean_no_nan(centerError_2015);
    
    [ overlapRate_2015 ] = overlapEvaluationQuad(CornersAll_2015, gtCornersAll);
    mOverlapRate_2015 = mean_no_nan(overlapRate_2015);

    for f = 1 : 1 : 101
        mSuccessRate_2015(f)     = sum(overlapRate_2015      > (f-1)/100 )/length(overlapRate_2015);
    end
    
    for f = 1 : 1 : 51
        mPrecisionRate_2015(f)     = sum(centerError_2015 < f-1 )/length(centerError_2015);
    end
     %% Calculate Rate Ivan
    [ centerError_Ivan ] = centerErrorEvaluation(CenterAll_Ivan,  gtCenterAll);
    mCenterError_Ivan = mean_no_nan(centerError_Ivan);
    
    [ overlapRate_Ivan ] = overlapEvaluationQuad(CornersAll_Ivan, gtCornersAll);
    mOverlapRate_Ivan = mean_no_nan(overlapRate_Ivan);
    
    for f = 1 : 1 : 101
        mSuccessRate_Ivan(f)= sum(overlapRate_Ivan > (f-1)/100)/length(overlapRate_Ivan);
    end
    
    for f = 1 : 1 : 51
        mPrecisionRate_Ivan(f)= sum(centerError_Ivan < f-1)/length(centerError_Ivan);
    end
    
    figure(seqIdx);title(['SuccessRate  ' seqs{seqIdx}.seqName]);  drawnow; hold on;
    figure(seqIdx); plot([0 : 0.01 : 1],mSuccessRate     ,'LineWidth',1.5,'Color','r'); hold on;
    figure(seqIdx); plot([0 : 0.01 : 1],mSuccessRate_2015,'LineWidth',1.5,'Color','g'); hold on;
    figure(seqIdx); plot([0 : 0.01 : 1],mSuccessRate_Ivan,'LineWidth',1.5,'Color','b'); hold on;
    legend(['KW 2016 [' sprintf('%f',mOverlapRate) ']'],...
           ['KW 2015 [' sprintf('%f',mOverlapRate_2015) ']'],...
           ['Ivan         [' sprintf('%f',mOverlapRate_Ivan) ']']);
    hold off;
    frm = getframe(gcf);
    [img_result, Map] = frame2im(frm);
    folderPath = [resultFolder '/' seqs{seqIdx}.seqName '/compare_MV_complete_QP_' sprintf('%d',qp)]; mkdir(folderPath);
    imwrite(img_result, [folderPath '/SuccessRate.png'], 'png', 'BitDepth',8);
    
    figure(seqIdx+100);title(['PrecisionRate  ' seqs{seqIdx}.seqName]);  drawnow; hold on;
    figure(seqIdx+100); plot([0 : 0.02 : 1],mPrecisionRate     ,'LineWidth',1.5,'Color','r'); hold on;
    figure(seqIdx+100); plot([0 : 0.02 : 1],mPrecisionRate_2015,'LineWidth',1.5,'Color','g'); hold on;
    figure(seqIdx+100); plot([0 : 0.02 : 1],mPrecisionRate_Ivan,'LineWidth',1.5,'Color','b'); hold on;
    legend(['KW 2016 [' sprintf('%f',1-(mCenterError/50)) ']'],...
           ['KW 2015 [' sprintf('%f',1-(mCenterError_2015/50)) ']'],...
           ['Ivan         [' sprintf('%f',1-(mCenterError_Ivan/50)) ']']);
    hold off;
    frm = getframe(gcf);
    [img_result, Map] = frame2im(frm);
    folderPath = [resultFolder '/' seqs{seqIdx}.seqName '/compare_MV_complete_QP_' sprintf('%d',qp)]; mkdir(folderPath);
    imwrite(img_result, [folderPath '/PrecisionRate.png'], 'png', 'BitDepth',8);
    
    
    
    
    
    
    
    fprintf('%3d.\t%s\tSucceceRate ploting end\n\n', seqIdx, seq.seqName);
    break;
end


