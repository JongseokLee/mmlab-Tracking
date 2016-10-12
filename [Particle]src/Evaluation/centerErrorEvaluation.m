function [ centerError ] = centerErrorEvaluation(rsCenter, gtCenter)
%%function [ overlapRate frameIndex ] = overlapEvaluationQuad(rsCorners, gtCorners, frameIndex)
%%Perform Overlap Rate Evaluation via Tracking Results and Ground Truth
%%Version 1.0
%%
%%Input:
%%  rsCenter:       Cell Structure; The tracking results in the i-th frame
%%                  [ xCenter yCenter ]
%%  gtCenter:       Cell Structure; The Ground Truth in the frameIndex{i}-th frame
%%                  [ xCenter yCenter ]
%%  frameIndex:     The Frame Index of Ground Truth
%%                  The i-th groundtruth is related with the frameIndex{i}-th frame
%%                  "It is too trivial to label gound truth for every frame,
%%                  especially for long-term sequence. Thus, a protion of
%%                  all frames are usually labeled manually. This parmeter indicates 
%%                  the labeled frames".               
%%Authour:
%%  Dong Wang-IIAU LAB-2011,05,10
%%  http://ice.dlut.edu.cn/lu/index.html
%%V1.0 (2011,05,10): Calculate Overlap Rate Evaluation via Tracking Results and Ground Truth
%%


centerError = zeros(1, size(rsCenter,2));
centerError(1) = 0.0;
for num = 2:size(rsCenter,2)
    centerError(num) = norm(rsCenter{num}-gtCenter{num});
end
centerError(centerError>=50) = 50;
