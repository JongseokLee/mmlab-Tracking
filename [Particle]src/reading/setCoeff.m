% Written by D.K Lee (dongkyu@media.kw.ac.kr)
%
%
% set coefficient to the representative value in unit size
%
% input
%   coeff_ori         	    coefficient
%   TuSize              TU size
%   numBlk_w            the number of blocks in width
%   numBlk_h			the number of blocks in height
%
% output
%   coeff               result coefficient


% function coeff  = setCoeff(coeff_ori, tuSize, blk_w, blk_h, blkSize)
function [coeff, coeff_v ,coeff_h] = setCoeff(coeff_ori, tuSize, blk_w, blk_h, blkSize)
TU = tuSize;
coeff = zeros(blk_h, blk_w);

coeff_ori = abs(coeff_ori);

for i=1: blk_h
    for j=1 : blk_w
        TU_size = TU(i,j);
        if TU_size ~= 0
            v = (i-1)*blkSize + 1;
            h = (j-1)*blkSize + 1;
            end_v = min(blk_h,v+TU_size-1);
            end_h = min(blk_w,h+TU_size-1);
%             ave = mean(mean(coeff_ori(v:end_v,h:end_h))); 
%             ave = mean(mean(coeff_ori(v:v+TU_size-1,h:h+TU_size-1)));           % ave or sum?
%             coeff(i:i+TU_size/blkSize-1, j:j+TU_size/blkSize-1) = ave;
            coeff(i:i+TU_size/blkSize-1, j:j+TU_size/blkSize-1) = abs(coeff_ori(v,h));
%             coeff_v(i:i+TU_size/blkSize-1, j:j+TU_size/blkSize-1) = abs(coeff_ori(v+1,h));
%             coeff_h(i:i+TU_size/blkSize-1, j:j+TU_size/blkSize-1) = abs(coeff_ori(v,h+1));
            TU(i:i+TU_size/blkSize-1, j:j+TU_size/blkSize-1) = 0;      
        end
    end
end

% med_coeff = medfilt2(coeff, [2 2]);
% nor_coeff = coeff/max(max(med_coeff));
% nor_coeff(nor_coeff < COEFF_TH) = 0;
% nor_coeff(nor_coeff >= COEFF_TH) = 1;
% coeff = nor_coeff;

%% 여기서부터 TH 별 성능 분석 후 C 구현


% med_coeff = medfilt2(coeff, [2 2]);
% log_coeff = log(med_coeff);
% 
% % figure, imagesc(log_coeff);
% 
% log_coeff(log_coeff < COEFF_TH) = 0;
% log_coeff(log_coeff >= COEFF_TH) = 1;
% coeff = log_coeff;

% figure, imagesc(coeff);

end