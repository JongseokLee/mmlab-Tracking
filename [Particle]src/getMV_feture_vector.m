function [ angle ] = getMV_feture_vector( gmc_mv, targetState, blockWise ,GT,nDirs)

zeroDir = -pi - 2*pi/nDirs;
[~, t, b, l, r] = getRecState(targetState,blockWise);

pMv.hor = gmc_mv.hor(t:b, l:r);
pMv.ver = gmc_mv.ver(t:b, l:r);
roiGT   = GT(t:b, l:r);
[rows, cols] = size(pMv.hor);

pMv.hor = reshape(pMv.hor, rows*cols,1);
pMv.ver = reshape(pMv.ver, rows*cols,1);
roiGT   = reshape(roiGT  , rows*cols,1);

angle = atan2(pMv.ver, pMv.hor);
angle(angle == pi) = -pi;
% angle( pMv.hor == 0 &  pMv.ver == 0 ) = zeroDir;
angle( pMv.hor == 0 &  pMv.ver == 0 ) = pi;
angle_int = floor(angle/(2*pi/nDirs)) + (nDirs/2) +1;
% ang_bac =zeros(size(angle_int));
% ang_tar =zeros(size(angle_int));
% mag   = sqrt((pMv.hor.^2) + (pMv.ver.^2));
n = 1 ;
m = 1 ;

n_1 =1;
n_1_f =1;
n_1_b =1;

n_11 =1;
n_11_f =1;
n_11_b =1;

n_7 =1;
n_7_f =1;
n_7_b =1;

n_5 =1;
n_5_f =1;
n_5_b =1;
for i =1 : rows*cols
    if roiGT(i) == 1
        ang_tar(n) = angle_int(i);
%         mag_tar(n) = mag(i);
        n = n+1;
    else
        ang_bac(m) = angle_int(i);
%         mag_bac(m) = mag(i);
        m = m+1;
    end
    
%     if  floor(i/cols +1)+t  < (t+b)/2
%         if floor(mod(i,cols)+1)+l < (l+r)/2
    if floor(mod(i,rows)+1)+t < (t+b)/2
         if  floor(i/rows +1)+l  < (l+r)/2 
            ang_11(n_11) = angle_int(i);
            n_11 = n_11 +1;
%             if roiGT(i) == 1
%                 ang_tar_11(n_11_f) = angle_int(i);
%                         mag_tar(n) = mag(i);
%                 n_11_f = n_11_f+1;
%             else
%                 ang_bac_11(n_11_b) = angle_int(i);
%                         mag_bac(m) = mag(i);
%                 n_11_b = n_11_b+1;
%             end
            
        else
            ang_1(n_1) = angle_int(i);
            n_1 = n_1+1;
%             if roiGT(i) == 1
%                 ang_tar_1(n_1_f) = angle_int(i);
%                         mag_tar(n) = mag(i);
%                 n_1_f = n_1_f+1;
%             else
%                 ang_bac_1(n_1_b) = angle_int(i);
%                         mag_bac(m) = mag(i);
%                 n_1_b = n_1_b+1;
%             end
        end
    else
%         if floor(mod(i,cols)+1)+l < (l+r)/2
         if  floor(i/rows +1)+l  < (l+r)/2 
            ang_7(n_7) = angle_int(i);
            n_7 = n_7+1;
%             if roiGT(i) == 1
%                 ang_tar_7(n_7_f) = angle_int(i);
%                 %         mag_tar(n) = mag(i);
%                 n_7_f = n_7_f+1;
%             else
%                 ang_bac_7(n_7_b) = angle_int(i);
%                 %         mag_bac(m) = mag(i);
%                 n_7_b = n_7_b+1;
%             end
        else
            ang_5(n_5) = angle_int(i);
            n_5 = n_5+1;
%             if roiGT(i) == 1
%                 ang_tar_5(n_5_f) = angle_int(i);
%                 %         mag_tar(n) = mag(i);
%                 n_5_f = n_5_f+1;
%             else
%                 ang_bac_5(n_5_b) = angle_int(i);
%                 %         mag_bac(m) = mag(i);
%                 n_5_b = n_5_b+1;
%             end
        end
    end
end

% figure(200);
% subplot(3,1,3);
% histogram(angle_int,'Normalization','probability','BinLimits',[0 10]);
% ylim([0 1]);
% title(['Estimate Target MV histogram']);    drawnow;
% 
% subplot(3,1,1);
% histogram(ang_tar,'Normalization','probability','BinLimits',[0 10]);
% ylim([0 1]);
% title(['GT Foreground MV histogram']);    drawnow;
% 
% 
% subplot(3,1,2);
% histogram(ang_bac,'Normalization','probability','BinLimits',[0 10]);
% ylim([0 1]);
% title(['GT background MV histogram']);    drawnow;

% figure(201);
% subplot(3,1,1);
% histogram(ang_tar_11,'Normalization','probability','BinLimits',[0 10]);
% ylim([0 1]);
% title(['11 GT Foreground MV histogram']);    drawnow;
% subplot(3,1,2);
% histogram(ang_bac_11,'Normalization','probability','BinLimits',[0 10]);
% ylim([0 1]);
% title(['11 GT background MV histogram']);    drawnow;
% subplot(3,1,3);
% histogram([ang_tar_11 , ang_bac_11],'Normalization','probability','BinLimits',[0 10]);
% ylim([0 1]);
% title(['11 Total MV histogram']);    drawnow;
% 
% 
% figure(202);
% subplot(3,1,1);
% histogram(ang_tar_7,'Normalization','probability','BinLimits',[0 10]);
% ylim([0 1]);
% title(['7 GT Foreground MV histogram']);    drawnow;
% subplot(3,1,2);
% histogram(ang_bac_7,'Normalization','probability','BinLimits',[0 10]);
% ylim([0 1]);
% title(['7 GT background MV histogram']);    drawnow;
% subplot(3,1,3);
% histogram([ang_tar_7 , ang_bac_7],'Normalization','probability','BinLimits',[0 10]);
% ylim([0 1]);
% title(['7 Total MV histogram']);    drawnow;
% % 
% figure(204);
% subplot(2,2,1);
% histogram([ang_tar_11 , ang_bac_11],'Normalization','probability','BinLimits',[0 10]);
% ylim([0 1]);
% title(['11 Total MV histogram']);    drawnow;
% 
% subplot(2,2,2);
% histogram([ang_tar_1 , ang_bac_1],'Normalization','probability','BinLimits',[0 10]);
% ylim([0 1]);
% title(['1 Total MV histogram']);    drawnow;
% 
% subplot(2,2,3);
% histogram([ang_tar_7 , ang_bac_7],'Normalization','probability','BinLimits',[0 10]);
% ylim([0 1]);
% title(['7 Total MV histogram']);    drawnow;
% 
% subplot(2,2,4);
% histogram([ang_tar_5 , ang_bac_5],'Normalization','probability','BinLimits',[0 10]);
% ylim([0 1]);
% title(['5 Total MV histogram']);    drawnow;

figure(205);
subplot(2,2,1);
histogram(ang_11 ,'Normalization','probability','BinLimits',[0 nDirs+2]);
ylim([0 1]);
title(['11 Total MV histogram']);    drawnow;

subplot(2,2,2);
histogram(ang_1,'Normalization','probability','BinLimits',[0 nDirs+2]);
ylim([0 1]);
title(['1 Total MV histogram']);    drawnow;

subplot(2,2,3);
histogram(ang_7,'Normalization','probability','BinLimits',[0 nDirs+2]);
ylim([0 1]);
title(['7 Total MV histogram']);    drawnow;

subplot(2,2,4);
histogram(ang_5,'Normalization','probability','BinLimits',[0 nDirs+2]);
ylim([0 1]);
title(['5 Total MV histogram']);    drawnow;

