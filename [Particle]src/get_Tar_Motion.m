function [ average ] = get_Tar_Motion( gmc_mv, targetState, blockWise )

[~, t, b, l, r] = getRecState(targetState,blockWise);

pMv.hor = gmc_mv.hor(t:b, l:r);
pMv.ver = gmc_mv.ver(t:b, l:r);

[rows, cols] = size(pMv.hor);

pMv.hor = reshape(pMv.hor, rows*cols,1);
pMv.ver = reshape(pMv.ver, rows*cols,1);

average.hor = mean(pMv.hor);
average.ver = mean(pMv.ver);





