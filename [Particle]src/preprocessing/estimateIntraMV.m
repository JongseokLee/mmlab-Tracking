% Written by S. Hossein Khatoonabadi (skhatoon@sfu.ca)
% Modified by D.K Lee (dongkyu@media.kw.ac.kr)
%
%
% motion vector estimation for intra-coded blocks
%
% input
%   predMode        coding mode info
%   MV.hor 			horizontal component of motion vectors
%   MV.ver 			vertical component of motion vectors
%   numBlk_w 		the number of blocks in width
%   numBlk_h 		the number of blocks in height
%   blk_size		block size
%
% output
%   MV.hor 			horizontal component of motion vectors
%   MV.ver 			vertical component of motion vectors
%   blkType			block type (coding mode info)

function [mv, predMode] = estimateIntraMV(puSize, predMode, mv, blockWise)

blk_h = blockWise(1);
blk_w = blockWise(2);

% 8x8 block-level operation
for i = 17 : 2 : blk_h - 16
    for j = 17 : 2 : blk_w - 16
        
        if predMode(i,j) == 1     % is current block intra-coded?
            if puSize(i,j) > 23
                blksize = 2; % Changeable
            else if puSize(i,j) > 15
                    blksize = 4; % Changeable
                else if puSize(i,j) > 7
                        blksize = 8; % Changeable
                    else 
                        blksize = 16; % Changeable
                    end
                end
            end
            
            num = 0;
            m = i-1;
            if predMode(m,j) == 0     % is upper block inter-coded?
                for k=j:j+blksize-1
                    num = num + 1;
                    neigMV.hor(num,1) = mv.hor(m,k);
                    neigMV.ver(num,1) = mv.ver(m,k);
                end
            end
            n = j-1;
            if predMode(i,n) == 0    % is left block inter-coded?
                for k=i:i+blksize-1
                    num = num + 1;
                    neigMV.hor(num,1) = mv.hor(k,n);
                    neigMV.ver(num,1) = mv.ver(k,n);
                end
            end
            
            m = i+blksize;
            if predMode(m,j) == 0     % is bottom block inter-coded?
                for k=j:min(blk_h,j+blksize-1)
                    num = num + 1;
                    neigMV.hor(num,1) = mv.hor(m,k);
                    neigMV.ver(num,1) = mv.ver(m,k);
                end
            end
            
            n = j+blksize;
            if predMode(i,n) == 0     % is right block inter-coded?
                for k=i:min(blk_w,i+blksize-1)
                    num = num + 1;
                    neigMV.hor(num,1) = mv.hor(k,n);
                    neigMV.ver(num,1) = mv.ver(k,n);
                end
                
            end
            
            if num == 0
                % set zero mv in the case of no neighboring mvs
                mv.hor(i:min(i+blksize-1,blk_h),j:min(blk_w,j+blksize-1)) = 0;
                mv.ver(i:min(i+blksize-1,blk_h),j:min(blk_w,j+blksize-1)) = 0;
            else            
                % get PVM from neighboring MVs
                [pvm] = getPVM(neigMV);
                
                % set the MVs of current MB to PVM
                mv.hor(i:i+blksize-1,j:j+blksize-1) = pvm.hor;
                mv.ver(i:i+blksize-1,j:j+blksize-1) = pvm.ver;
            end
            
            % excluding all blocks in the current MB (intra-coded) from further processing
            predMode(i:min(i+blksize-1,blk_h),j:min(blk_w,j+blksize-1)) = -1;
        end
    end
end