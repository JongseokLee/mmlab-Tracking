
function [roi,top,bottom,left,right,w,h,data] = getROI(mask, val, roiOffset)

[blk_h,blk_w] = size(mask);

[idx_ver, idx_hor] = find(mask == val);
top    = max(1,     min(idx_ver)-roiOffset);
bottom = min(blk_h, max(idx_ver)+roiOffset);
left   = max(1,     min(idx_hor)-roiOffset);
right = min(blk_w,  max(idx_hor)+roiOffset);

roi = [top bottom left right];
w = right - left + 1;
h = bottom - top + 1;
data = mask(top:bottom,left:right);
end





