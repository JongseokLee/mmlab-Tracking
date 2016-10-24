clc, clear;


warning('off', 'MATLAB:MKDIR:DirectoryExists');
warning('off', 'images:initSize:adjustingMag');
addpath(genpath('[Particle]src_enc'))
path = 'D:\CompressedDomainObjectTracking\mmlab-Tracking\[Particle]src_input\';
% mkdir('[Particle]src_input]');
%% Sequence Parameters
qp = 22;                %-Quantization Parameter 22, 27, 32, 37
blkSize = 1;            %-Block size for blockwise
seqs = InitParams(qp);  %-Sequence info.
codecs = cell(1,2);

codecs{1,1} = 'encoder.exe';
codecs{1,2} = 'Tracker_Input_Extraction.exe';
encoder = codecs{1, 1};
decoder = codecs{1, 2};

for seqidx = 1 : size(seqs,1)
    seq = sprintf('%03d', seqs{seqidx}.seqName);
    
    
    
    %% INITIALIZATION
    seq = seqs{seqidx};
    
    [startFrame, endFrame, inputPathes, imgPathes, img_w, img_h] = getSeqParams(seq);
    
    nFrame = endFrame-startFrame+2;
    
%     Y = zeros(img_h,img_w);
%     U = zeros(img_h/2,img_w/2);
%     V = zeros(img_h/2,img_w/2);
    
    fid=fopen([seq.seqName '.yuv'], 'wb');
    
    if rem(img_h, 8) ==0 && rem(img_w,8) == 0
         
    for t = 1 : nFrame
        
        fprintf('%d\n', t);
        img = imread(imgPathes.img{t,1});
%         img_size = size(img);
%         yuv = rgb2ycbcr(img);
        fwrite(fid, img, 'uint8');
       
%         Y = uint8(yuv(:,:,1));
%         U = uint8(imresize(yuv(:,:,2),[img_h/2, img_w/2], 'nearest'));
%         V = uint8(imresize(yuv(:,:,3),[img_h/2, img_w/2], 'nearest'));
        U = uint8(zeros(img_h/2, img_w/2));
        V = uint8(zeros(img_h/2, img_w/2));
%         fwrite(fid,Y','uint8');
        fwrite(fid,U','uint8');
        fwrite(fid,V','uint8');
        
    end
   
    fclose(fid);
    
    elseif rem(img_h, 8) ~=0 && rem(img_w,8) == 0
        img_h = (fix(img_h/8)+1)*8;
        for t = 1 : nFrame
        
        fprintf('%d\n', t);
        img = imread(imgPathes.img{t,1});
%         img_size = size(img);
        img = imresize(img, [img_h, img_w], 'nearest');
        imwrite(img, imgPathes.img{t,1});
%         yuv = rgb2ycbcr(img);
        
        
       img = uint8(imresize(img,[img_h, img_w], 'nearest'));
       fwrite(fid, img, 'uint8');
%         Y = uint8(yuv(:,:,1));
%         U = uint8(imresize(yuv(:,:,2),[img_h/2, img_w/2], 'nearest'));
%         V = uint8(imresize(yuv(:,:,3),[img_h/2, img_w/2], 'nearest'));
        U = uint8(zeros(img_h/2, img_w/2));
        V = uint8(zeros(img_h/2, img_w/2));
%         fwrite(fid,Y','uint8');
        fwrite(fid,U','uint8');
        fwrite(fid,V','uint8');
        
    end
   
    fclose(fid);
    end
    
    for qp = 22 : 5 : 37
        
        en_str = [ encoder ' -c encoder_cfg.cfg -i ' seq.seqName  '.yuv  -b [Particle]src_input\' seq.seqName '_QP_' num2str(qp) '.bin ' '-o '  'rec_enc.yuv' ' -q ' num2str(qp) ' -wdt ' num2str(img_w) ' -hgt ' num2str(img_h) ' -f ' num2str(nFrame) ' -fr 30' ];
        dos(en_str);
        
        mkdir(['[Particle]src_input\' seq.seqName '_QP_' num2str(qp)  '\Input']);
        de_str = [ path decoder ' -b ' path seq.seqName '_QP_' num2str(qp) '.bin ' ' -o ' path 'rec_dec.yuv' ];
        dos(de_str);
        
        str = [ encoder '   seq = ' seq.seqName '   qp = ' num2str(qp) ];
        disp(str);
    end
end


