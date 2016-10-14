function [pvm] = preMaskProjection(preMask, mv, blockWise, blkSize)
% state = zeros(7);

% block info.
blk_h = blockWise(1);
blk_w = blockWise(2);
numBlk = blk_h*blk_w;

% current mask initialization by projecting the current MV to the previous mask
% mask = zeros(size(preMask));

% center coordinates in image size
if blkSize == 1
    pos_hor = reshape(floor((1:numBlk) ./ blk_h + 1), blk_h, blk_w);
    pos_ver = reshape(floor((1:numBlk) ./ blk_w + 1), blk_w, blk_h);
else
    pos_hor = reshape(floor((0:numBlk-1) ./ blk_h) .* blkSize + blkSize/2, blk_h, blk_w);
    pos_ver = reshape(floor((0:numBlk-1) ./ blk_w) .* blkSize + blkSize/2, blk_w, blk_h);
end
pos_ver = pos_ver';

pos_hor_new = pos_hor + mv.hor;
pos_ver_new = pos_ver + mv.ver;

idx_hor = ceil(pos_hor_new/blkSize);
idx_ver = ceil(pos_ver_new/blkSize);
num = 0;
for i=1 : blk_h
    for j=1 : blk_w
        idx_ver(i,j) = max(1, min(idx_ver(i,j), blk_h));
        idx_hor(i,j) = max(1, min(idx_hor(i,j), blk_w));
        if(preMask(idx_ver(i,j), idx_hor(i,j)) == 1 )
            num = num + 1;
            %             mask(i,j) = 1;
            mv_t.hor(num,1) = mv.hor(i,j);
            mv_t.ver(num,1) = mv.ver(i,j);
        end
    end
end
[pvm] = getPVM(mv_t);
% [~, top, bottom, left, right] = getROI(mask, 1, 0);
% mask(top:bottom,left:right) = imfill(mask(top:bottom,left:right), 'hole');
end