clc, clear;


warning('off', 'MATLAB:MKDIR:DirectoryExists');
warning('off', 'images:initSize:adjustingMag');
addpath(genpath('[Particle]src'))

%% Sequence Parameters
qp = 22;                %-Quantization Parameter 22, 27, 32, 37
blkSize = 1;            %-Block size for blockwise
seqs = InitParams(qp);  %-Sequence info.
codecs = cell(1,2);

codecs{1,1} = 'KWU_SDC_ENCODER.exe';
codecs{1,2} = 'KWU_SDC_DEC.exe';
encoder = codecs{codecidx, 1};
decoder = codecs{codecidx, 2};
for seqidx = 1 : size(seqs,2)
    seq = sprintf('%03d', seqs(seqidx));
    
    %% INITIALIZATION
    seq = seqs{seqIdx};
    [startFrame, endFrame, inputPathes, imgPathes, img_w, img_h] = getSeqParams(seq);
    
    for qp = 22 : 5 : 37
        
        en_str = [ encoder ' ../Original_RGB_10/LCDF' seq '.rgb out.bin ' num2str(qp) ' rec_enc.rgb'];
        dos(en_str);
        
        de_str = [ decoder ' out.bin rec_dec.rgb' ];
        dos(de_str);
        
        
        
        str = [ encoder '   seq = ' seq '   qp = ' num2str(qp) ];
        disp(str);
    end
end


