function [startFrame, endFrame, inputPathes, imgPathes, img_w, img_h] = getSeqParams(seq)

% startFrame   = seqs{seqIdx}.startFrame;
% endFrame     = seqs{seqIdx}.endFrame;
% imgPathes    = seqs{seqIdx}.imgPathes;
% inputPathes  = seqs{seqIdx}.inputPathes;

startFrame   = seq.startFrame;
endFrame     = seq.endFrame;
imgPathes    = seq.imgPathes;
inputPathes  = seq.inputPathes;

img_w = seq.img_w;
img_h = seq.img_h;

end