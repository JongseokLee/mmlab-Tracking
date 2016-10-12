% Written by S. Hossein Khatoonabadi (skhatoon@sfu.ca)
% Modified by D.K Lee (dongkyu@media.kw.ac.kr)
%
%
% Global Motion Estimation & Compensation (GMEC)
%
% input
%   MV.hor          horizontal component of motion vectors
%   MV.ver          vertical component of motion vectors
%   blkType         block type (coding mode info)
%   mask            mask info. for the ground truth (object : 1, non-object : 0)
%   numBlk_w        the number of blocks in width
%   numBlk_h        the number of blocks in height
%
% output
%   GMP             Global motion parameters (GMP)
%   GMC_MV.hor      horizontal component of global motion compensated motion vectors in the current frame
%   GMC_MV.ver      vertical component of global motion compensated motion vectors in the current frame

function [gmc_mv, gmp] = GMEC(mv, mask, puSize, predMode, blockWise, blkSize)

%% initialization
GME_MAX_ITR = 20;

GMC_CONVRG = 0.001;          % Global Motion Estimation (GME) termination criterion (error)
CUTOFF_STD_COEF = 2;        % coefficient of standard deviation of errors
USE_ALL_BLK_PERC = 0.1;     % minimum percentage of blocks to be considered for GME
STOP_BLK_PERC = 0.5;        % GME termination criterion (the number of blocks with weighting)

blk_h = blockWise(1);
blk_w = blockWise(2);
numBlk = blk_h*blk_w;

V_hor = reshape(mv.hor, numBlk, 1);
V_ver = reshape(mv.ver, numBlk, 1);

% center coordinates in image size
if blkSize == 1
    pos_hor = reshape(mod(0:numBlk-1, blk_w)+1, blk_w, blk_h);
    pos_hor = reshape(pos_hor', numBlk, 1);
    pos_ver = reshape(mod(0:numBlk-1, blk_h)+1, numBlk, 1);
else
    pos_hor = reshape(mod(0:numBlk-1, blk_w)*blkSize + blkSize/2, blk_w, blk_h);
    pos_hor = reshape(pos_hor', numBlk, 1);
    pos_ver = reshape(mod(0:numBlk-1, blk_h)*blkSize + blkSize/2, numBlk, 1);
end

V = zeros(2*numBlk,1);                                   % [DK] : get pairs of block center position moved by v_x and v_y
V(1:2:end) = V_ver + pos_ver; 
V(2:2:end) = V_hor + pos_hor;

H = zeros(2*numBlk, 6);
H(1:2:end,1) = 1; H(1:2:end,2) = pos_ver; H(1:2:end,3) = pos_hor;       % [DK]: H = 1 x y 0 0 0
H(2:2:end,4) = 1; H(2:2:end,5) = pos_ver; H(2:2:end,6) = pos_hor;       %           0 0 0 1 x y

% initial wights
W = ones(numBlk, 1);
W_2 = ones(2*numBlk, 1);

% only keep large size blocks and discard small size blocks and intra-coded blocks
o = reshape(puSize, numBlk, 1);
q = reshape(predMode, numBlk, 1);  %if intra

% assume that more than 8x8-size is large
W(o > 24) = 0;

% discard intra-block
W(q == -1) = 0; 

% remove the region of object (imagine the object in the previous frame has the same position in the current frame)
o = reshape(mask, numBlk, 1);
W(o~=0) = 0;

% reduce weights for those blocks which are different from their neighbors
mv.ver = wextend('2D', 'sym', mv.ver, 1);
mv.hor = wextend('2D', 'sym', mv.hor, 1);

% difference calculation with neighbors
dif = zeros(blk_h, blk_w);
for i=2 : blk_h+1
    for j=2 : blk_w+1
        d = abs(mv.ver(i,j)-mv.ver(i-1:i+1,j-1:j+1)) + abs(mv.hor(i,j)-mv.hor(i-1:i+1,j-1:j+1));
        
        % median of the differences
        dif(i-1,j-1) = median(d(:));
    end
end
dif = reshape(dif,numBlk,1);

dif = exp(-dif);
W = W.*dif;

% if there is not enough blocks to estimate GME then use all blocks
if sum(W~=0) < numBlk*USE_ALL_BLK_PERC
    W = ones(numBlk,1);
end

%% Global Motion Estimation (GME)
old_m_e = 0;
HtW = zeros(6, 2*numBlk);

% GME iteration
for count=1 : GME_MAX_ITR
    
    % extend weight
    W_2(1:2:end) = W; W_2(2:2:end) = W;
    
    for i=1 : 6
        HtW(i,:) = H(:,i).*W_2;
    end
    
    % GMP calculation
    gmp = (HtW*H) \ (HtW*V);
    
    % global MV calculation
    pos_ver_new = gmp(1) + gmp(2)*pos_ver + gmp(3)*pos_hor - pos_ver;
    pos_hor_new = gmp(4) + gmp(5)*pos_ver + gmp(6)*pos_hor - pos_hor;
    
    % error between actual MV and global MV
    e = abs(V_ver - pos_ver_new) + abs(V_hor - pos_hor_new);
    
    % discard those blocks which we ignored it before
    e(W==0) = 1000;
    
    % only use those blocks which might have background motion
    % estimation error with non-zero weighting factors
    eNonzero = e(W~=0);
    
    % mean & standard deviation of the errors
    m_e = mean(eNonzero);
    std_e = std(eNonzero);
    
    % termination check
    if abs(m_e - old_m_e) < GMC_CONVRG || max(eNonzero) < GMC_CONVRG
        break
    end
    old_m_e = m_e;
    
    % weighting update
    c_m_e = m_e + CUTOFF_STD_COEF*std_e;
    W = (1-( ( e./c_m_e).^2 ) ).^2;
    W(e > c_m_e) = 0;
    
    % stop iteration, if there is not enough blocks to estimate GM
    if sum(W~=0) < numBlk*STOP_BLK_PERC
        break
    end
end

%% Global Motion Compensation (GMC)
% global MV calculation
V_ver_new = gmp(1) + gmp(2)*pos_ver + gmp(3)*pos_hor - pos_ver;
V_hor_new = gmp(4) + gmp(5)*pos_ver + gmp(6)*pos_hor - pos_hor;

% GMC
gmc_mv.hor = V_hor - V_hor_new;
gmc_mv.hor = reshape(gmc_mv.hor, blk_h, blk_w);

gmc_mv.ver = V_ver - V_ver_new;
gmc_mv.ver = reshape(gmc_mv.ver, blk_h, blk_w);

gmc_mv.hor = round(gmc_mv.hor);
gmc_mv.ver = round(gmc_mv.ver);
end