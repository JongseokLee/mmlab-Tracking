function [gmc_mv, gmp] = roiGMEC(mv, proMask, puSize, predMode, blockWise, blkSize)

%-roi offset ratio (ratio of the side length of the object)
roiRatio = 0.3;

blk_h = blockWise(1);
blk_w = blockWise(2);

%-Mask initialization
mask = proMask;

%-roi setting
[~,top,bottom,left,right] = getROI(mask, 1, 0);

%-Clipping
top    = max(1,     top    - round(blk_h*roiRatio));
bottom = min(blk_h, bottom + round(blk_h*roiRatio));
left   = max(1,     left   - round(blk_w*roiRatio));
right  = min(blk_w, right  + round(blk_w*roiRatio));

roi_mv.hor   = mv.hor  (top:bottom, left:right);
roi_mv.ver   = mv.ver  (top:bottom, left:right);
roi_predMode = predMode(top:bottom, left:right);
roi_puSize   = puSize  (top:bottom, left:right);
roi_mask     = mask    (top:bottom, left:right);

roi_blockWise = [bottom-top+1 right-left+1];

%-roi-based GMEC
[roi_gmc_mv, gmp] = GMEC(roi_mv, roi_mask, roi_puSize, roi_predMode, roi_blockWise, blkSize);

%-GMC motion vector
gmc_mv.hor = zeros(size(mv.hor));
gmc_mv.ver = zeros(size(mv.ver));
gmc_mv.hor(top:bottom, left:right) = roi_gmc_mv.hor;
gmc_mv.ver(top:bottom, left:right) = roi_gmc_mv.ver;