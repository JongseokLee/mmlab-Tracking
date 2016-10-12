function p = cal_Projection_weight(preMask, mv, pState, blockWise, blkSize, coeff,tar_rec)
% block info.
blk_h = blockWise(1);
blk_w = blockWise(2);
numBlk = blk_h*blk_w;
mv_th = max(max(coeff))*0.6;
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
[~, t, b, l, r] = getRecState(pState,blockWise);
for i=t : b
   for j= l : r
        idx_ver(i,j) = max(1, min(idx_ver(i,j), blk_h));
        idx_hor(i,j) = max(1, min(idx_hor(i,j), blk_w));
        if(preMask(idx_ver(i,j), idx_hor(i,j)) == 1 && coeff(i,j) <= mv_th)
            num = num + 1;
        end
    end
end
N = (tar_rec(2)-tar_rec(1))*(tar_rec(4)-tar_rec(3));
p = num/N;
p = 1 - p;