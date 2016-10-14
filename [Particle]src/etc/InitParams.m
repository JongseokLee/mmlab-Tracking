function seqs = InitParams(qp)

% loads data and initializes variables
%**************************************************************************
% folder      : folder name
% fileType   : Image format of the sequence
% numzeros    : number of digits for the frame index
% startFrame : first frame index to be tracked
% endFrame  : last  frame index to be tracked
% qp          : quantization parameter for video compression
%**************************************************************************

seqs = cell(1,1);   seqIdx = 1;

%% Sequence List
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
seqs{seqIdx}.seqName = 'Coastguard';      seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 100 ;   seqs{seqIdx}.img_w = 352;   seqs{seqIdx}.img_h = 288 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
seqs{seqIdx}.seqName = 'Mobile';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 236 ;   seqs{seqIdx}.img_w = 352;   seqs{seqIdx}.img_h = 288 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
seqs{seqIdx}.seqName = 'Stefan';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 90  ;   seqs{seqIdx}.img_w = 352;   seqs{seqIdx}.img_h = 288 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;

seqs{seqIdx}.seqName = 'KiteSurf';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 84  ;   seqs{seqIdx}.img_w = 480;   seqs{seqIdx}.img_h = 270 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
seqs{seqIdx}.seqName = 'KiteSurf';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 84  ;   seqs{seqIdx}.img_w = 480;   seqs{seqIdx}.img_h = 270 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;





% seqs{seqIdx}.seqName = 'FlowerGarden';    seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 50  ;   seqs{seqIdx}.img_w = 352;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'City';            seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 100 ;   seqs{seqIdx}.img_w = 352;   seqs{seqIdx}.img_h = 288 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Foreman';         seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 100 ;   seqs{seqIdx}.img_w = 352;   seqs{seqIdx}.img_h = 288 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'TableTennis';     seqs{seqIdx}.startFrame = 5  ;    seqs{seqIdx}.endFrame = 25  ;   seqs{seqIdx}.img_w = 352;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% 
% seqs{seqIdx}.seqName = 'bag';             seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 196  ;   seqs{seqIdx}.img_w = 480;   seqs{seqIdx}.img_h = 360 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'basketball';      seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 725  ;   seqs{seqIdx}.img_w = 576;   seqs{seqIdx}.img_h = 432 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'bolt1';           seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 350  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 360 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'bolt2';           seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 293  ;   seqs{seqIdx}.img_w = 480;   seqs{seqIdx}.img_h = 264 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'car1';            seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 742  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'crossing';        seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 131  ;   seqs{seqIdx}.img_w = 1208;  seqs{seqIdx}.img_h = 680 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'dinosaur';        seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 326  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'fish1';           seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 366  ;   seqs{seqIdx}.img_w = 456;   seqs{seqIdx}.img_h = 344 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'fish3';           seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 519  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 360 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'fish4';           seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 682  ;   seqs{seqIdx}.img_w = 456;   seqs{seqIdx}.img_h = 256 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'hand';            seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 267  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'handball1';       seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 377  ;   seqs{seqIdx}.img_w = 384;   seqs{seqIdx}.img_h = 288 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'motocross1';      seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 164  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 360 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'pedestrian2';     seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 713  ;   seqs{seqIdx}.img_w = 480;   seqs{seqIdx}.img_h = 640 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'racing';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 156  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

seqs = seqs';
[nSeqs,~] = size(seqs);

%% Update "Data_pathes"
folder = '..\Dataset';
fileType.img          = 'jpg';
fileType.groundTruth  = 'bmp';
fileType.in           = 'bin';
numzeros = 4;

%% Sequence-level input
for seqIdx=1:nSeqs
    endFrame  = seqs{seqIdx}.endFrame;
    seqName   = seqs{seqIdx}.seqName;
    
    seqs{seqIdx}.imgPathes.img         = cell(endFrame,1);
    seqs{seqIdx}.imgPathes.groundTruth = cell(endFrame,1);
    seqs{seqIdx}.performance           = -1 * ones(endFrame,3);
    seqs{seqIdx}.time                  = -1 * ones(endFrame,1);
    
    seqs{seqIdx}.inputPathes.MV.hor           = strcat(folder,'\',seqName,'\','qp_',num2str(qp),'\','Input','\','MotionVector_Horizontal','.',fileType.in);
    seqs{seqIdx}.inputPathes.MV.ver           = strcat(folder,'\',seqName,'\','qp_',num2str(qp),'\','Input','\','MotionVector_Vertical'  ,'.',fileType.in);
    seqs{seqIdx}.inputPathes.coeff            = strcat(folder,'\',seqName,'\','qp_',num2str(qp),'\','Input','\','DCT_Coefficient'        ,'.',fileType.in);
    seqs{seqIdx}.inputPathes.predMode         = strcat(folder,'\',seqName,'\','qp_',num2str(qp),'\','Input','\','PredictionMode'         ,'.',fileType.in);
    seqs{seqIdx}.inputPathes.PuSize           = strcat(folder,'\',seqName,'\','qp_',num2str(qp),'\','Input','\','PredictionUnitSize'     ,'.',fileType.in);
    seqs{seqIdx}.inputPathes.TuSize           = strcat(folder,'\',seqName,'\','qp_',num2str(qp),'\','Input','\','TransformUnitSize'      ,'.',fileType.in);
    
    nz	= strcat('%0',num2str(numzeros),'d'); %number of zeros in the name of image
    for t=1:endFrame
        id=sprintf(nz,t);
        seqs{seqIdx}.imgPathes.img{t}         = strcat(folder,'\',seqName,'\','img',        '\',id,'.',fileType.img         );
        seqs{seqIdx}.imgPathes.groundTruth{t} = strcat(folder,'\',seqName,'\','groundTruth','\',id,'.',fileType.groundTruth );
     
    end
end

%-Display sequences
for seqIdx=1:nSeqs
    fprintf('%3d.\t%s\n', seqIdx, seqs{seqIdx}.seqName);
end
fprintf('\n\n');

clear seqName fileType folder id image_no nframes nseqs numzeros nz qp qp folder nSeqs nframes numzeros seqIdx startFrame endFrame t img_w img_h;



