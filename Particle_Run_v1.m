clc, clear;
% close all;

warning('off', 'MATLAB:MKDIR:DirectoryExists');
warning('off', 'images:initSize:adjustingMag');
addpath(genpath('[Particle]src'))
resultFolder = '..\[Particle]Result';

%% Sequence Parameters
qp = 22;                %-Quantization Parameter 22, 27, 32, 37
blkSize = 1;            %-Block size for blockwise
seqs = InitParams(qp);  %-Sequence info.

%% Particle Filter Parameters
nParticles = 100;       % # of particles
wSig = 0.01;
sNoise = [1.0,1.0, 0.1 , 0.1 ,0.1, 0.1, 0.2 ];
%back_ground_region_parameter
B_AREA_RATIO = 4;

%update rate
alpa = 0.8;

% MV histogramc
nDirs = 8;              % # of orientations

% range of particles during initialization
vx_max = 0.05;
vy_max = 0.05;
sc_max = 0.2;

% NOTE : x-axis is vertical in this case
% state = [ x, y, vx, vy, Hx, Hy, sc]
% [x,y] - centroid of the targetA
% [vx,vy] - velocities
% [Hx,Hy] - size of the target (for now a rectangle, maybe an ellispe in the future)
% sc - scaling factor

%% Options
flagMAP   = 0;    % flag for MAP estimate
flagMTI   = 0;    % flag for the manual target initialization
testPlot  = 0;    % flog for test plot
BREAK     = 0;    % Tracking one sequence
fsave_d   = 0;    % flag for saving result data such as corner points and center points.
fsave_r   = 0;    % flag for saving result of tracking in image file.

for seqIdx = 1: size(seqs)
    folderPath = [resultFolder '/' seqs{seqIdx}.seqName '/Mask_MV_complete_QP_' sprintf('%d',qp)]; mkdir(folderPath);
    
    %% INITIALIZATION
    seq = seqs{seqIdx};
    [startFrame, endFrame, inputPathes, imgPathes, img_w, img_h] = getSeqParams(seq);
    
    %-Size of blockwise-domain
    imgSize = [img_h, img_w];
    blk_w = img_w / blkSize; blk_h = img_h / blkSize;
    blockWise = [blk_h, blk_w];
    
    % initial target state
    [ targetState, rec ] = getInitialTargetState( seq, blockWise, flagMTI );
    
    % initial input reading
    [predMode, puSize, ~, ~, mv, fmv] = readInput(inputPathes, startFrame, imgSize, blkSize);
    
    img = imread(imgPathes.img{startFrame}); img = img(1:img_h,1:img_w,:);
    
    targetRec = zeros(blockWise);
    targetRec(rec(1):rec(2), rec(3):rec(4)) = 1;
    
    % MV estimation for intra-coded blocks & GMEC
    [mv, predMode] = estimateIntraMV(puSize, predMode, mv, blockWise);
    
    [est_motion]= preMaskProjection(targetRec, fmv, blockWise, blkSize);
    
    % init particles
    particleStates = initParticles( targetState, nParticles, [vx_max; vy_max; sc_max], blockWise );
    
    %% Background Feature Extraction
    [ BF, mag, max_mag,angle ] = BF_extraction(targetState,fmv,est_motion,B_AREA_RATIO,nDirs,blockWise);
              targetFeature_MV = get_MV_FF(mag,max_mag,angle,targetState,blockWise,nDirs);
    %% set weights
    weights = calWeight(particleStates, blockWise, targetFeature_MV, wSig, nDirs,mag,max_mag,angle,BF);
    
    if fsave_d == 1
        TotalFrameNum = endFrame - startFrame;
        CenterAll  = cell(1,TotalFrameNum);
        CornersAll = cell(1,TotalFrameNum);
    end
    close;
    %% TRACKING
    %-Frame-level tracking
    fprintf('%3d.\t%s\t2016 Tracking Begin...\n',seqIdx, seq.seqName);   t_total = 0;
    for t = startFrame+1 : 1 : endFrame
        if sum(sum(targetRec)) == 0
            break;
        end
        
        %% Input reading
        [predMode, puSize, ~, ~, mv, fmv] = readInput(inputPathes, t, imgSize, blkSize);
       
        img = imread(imgPathes.img{t}); img = img(1:img_h,1:img_w,:);
        % showMV(img, mv.hor, mv.ver, t, blk_w, blk_h, blkSize);
        tic;
        
        %% PRE-PROCESSING
        % MV estimation for intra-coded blocks & GMEC
        [mv, predMode] = estimateIntraMV(puSize, predMode, mv, blockWise);
        [ est_motion ] = preMaskProjection(targetRec, fmv, blockWise, blkSize);

       %%  PARTICLE FILTERS
        % resampling
        [particleStates,~] = rs_systematic( particleStates, weights);
        
        if testPlot
            showParticles( img, particleStates, 0, 1, ['Resample for Frame ' num2str(t)] ,weights );   drawnow;
        end
        
       %% background and foreground feature extraction
        [BF, mag, max_mag,angle] = BF_extraction(targetState,fmv,est_motion,B_AREA_RATIO,nDirs,blockWise);
        
       %% prediction (importance sampling)
        particleStates = propagate( particleStates,sNoise, blockWise ,est_motion);
        
        if testPlot
            showParticles(img, particleStates, 0, 2, ['Importance Sampling for Frame ' num2str(t)] ,weights );  drawnow;
        end
        
       %% update (observation likelihood)
        weights = calWeight(particleStates, blockWise, targetFeature_MV, wSig, nDirs,mag,max_mag,angle,BF);
        
        % estimate target state
        if ~flagMAP
            targetState =  estimate( particleStates, weights );
        else
            [~,idx] = max(weights);
            targetState = particleStates(idx,:);
        end
        
        Feature_MV       = get_MV_FF(mag,max_mag,angle, targetState,blockWise,nDirs);
        
        targetFeature_MV = (1-alpa)*targetFeature_MV + alpa*Feature_MV;
        
        if fsave_d == 1
            if targetState(5) < 5 || targetState(6) < 5
                for i = t : endFrame
                    CenterAll {t - startFrame} = zeros(1,2);
                    CornersAll{t - startFrame} = zeros(2,4);
                end
                break;
            end
        end
        
        rec = getRecState(targetState,blockWise);
        targetRec = zeros(blockWise);   targetRec(rec(1):rec(2),rec(3):rec(4)) = 1;
        rect    = [rec(3), rec(1), rec(4)-rec(3), rec(2)-rec(1)];
        seq.time(t) = toc;
        
        %% Save data
        if fsave_d == 1
            
            center  = [rect(2)+rect(4)/2 rect(1)+rect(3)/2];
            corners = [rect(1) rect(1)         rect(1)+rect(3) rect(1)+rect(3) rect(1);
                       rect(2) rect(2)+rect(4) rect(2)+rect(4) rect(2)         rect(2)];
            
            CenterAll {t - startFrame}  = center;
            CornersAll{t - startFrame} = corners;
            
        end
        
       %% RESULT
        %-Show estimated result to a image file
        rect = int16(rect);
        showResult( img, t ,rect,est_motion);
        %% Write estimated result to a image file
        if fsave_r == 1
            frm = getframe(gcf);
            [img_result, Map] = frame2im(frm);
            imwrite(img_result, [folderPath '/' sprintf('%04d',t) '.png'], 'png', 'BitDepth',8);
        end
    end
    
    if fsave_d == 1
        save([folderPath '/' seqs{seqIdx}.seqName '_2016.mat'], 'CornersAll','CenterAll');
    end
    
    fprintf('%3d.\t%s\tTracking End\n\n', seqIdx, seq.seqName);
    if BREAK == 1
        break;
    end
    
end
