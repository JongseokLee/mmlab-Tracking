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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% benchmark dataset %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% seqs{seqIdx}.seqName = 'Basketball';      seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 725  ;   seqs{seqIdx}.img_w = 576;   seqs{seqIdx}.img_h = 432 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Biker';           seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 142  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 360 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Bird1';           seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 408  ;   seqs{seqIdx}.img_w = 720;   seqs{seqIdx}.img_h = 400 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'BlurBody';        seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 334  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'BlurCar2';        seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 585  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'BlurFace';        seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 493  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'BlurOwl';         seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 631  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Bolt';            seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 350  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 360 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Box';             seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 1161 ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Car1';            seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 1020 ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Car4';            seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 659  ;   seqs{seqIdx}.img_w = 360;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'CarDark';         seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 393  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'CarScale';        seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 252  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 272 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'ClifBar';         seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 472  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Couple';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 140  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Crowds';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 347  ;   seqs{seqIdx}.img_w = 600;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'David';           seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 770  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Deer';            seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 71   ;   seqs{seqIdx}.img_w = 704;   seqs{seqIdx}.img_h = 400 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Diving';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 231  ;   seqs{seqIdx}.img_w = 400;   seqs{seqIdx}.img_h = 224 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'DragonBaby';      seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 113  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 360 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Dudek';           seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 1145 ;   seqs{seqIdx}.img_w = 720;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Football';        seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 362  ;   seqs{seqIdx}.img_w = 624;   seqs{seqIdx}.img_h = 352 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Freeman4';        seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 297  ;   seqs{seqIdx}.img_w = 360;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Girl';            seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 500  ;   seqs{seqIdx}.img_w = 128;   seqs{seqIdx}.img_h = 96  ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Human3';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 1698 ;   seqs{seqIdx}.img_w = 480;   seqs{seqIdx}.img_h = 640 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Human4';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 667  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Human6';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 792  ;   seqs{seqIdx}.img_w = 480;   seqs{seqIdx}.img_h = 640 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Human9';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 305  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Ironman';         seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 166  ;   seqs{seqIdx}.img_w = 720;   seqs{seqIdx}.img_h = 304 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Jump';            seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 122  ;   seqs{seqIdx}.img_w = 416;   seqs{seqIdx}.img_h = 234 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Jumping';         seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 313  ;   seqs{seqIdx}.img_w = 352;   seqs{seqIdx}.img_h = 288 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Liquor';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 1741 ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Matrix';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 100  ;   seqs{seqIdx}.img_w = 800;   seqs{seqIdx}.img_h = 336 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'MotorRolling';    seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 164  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 360 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Panda';           seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 1000 ;   seqs{seqIdx}.img_w = 312;   seqs{seqIdx}.img_h = 233 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'RedTeam';         seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 1918 ;   seqs{seqIdx}.img_w = 352;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Shaking';         seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 365  ;   seqs{seqIdx}.img_w = 624;   seqs{seqIdx}.img_h = 352 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Singer2';         seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 366  ;   seqs{seqIdx}.img_w = 624;   seqs{seqIdx}.img_h = 352 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Skating1';        seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 400  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 360 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Skating2';        seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 473  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 352 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Skiing';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 81   ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 360 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Soccer';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 392  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 360 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Surfer';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 376  ;   seqs{seqIdx}.img_w = 480;   seqs{seqIdx}.img_h = 360 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Sylvester';       seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 1345 ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Tiger2';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 365  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Trellis';         seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 569  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Walking';         seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 412  ;   seqs{seqIdx}.img_w = 768;   seqs{seqIdx}.img_h = 576 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Walking2';        seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 500  ;   seqs{seqIdx}.img_w = 384;   seqs{seqIdx}.img_h = 288 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Woman';           seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 597  ;   seqs{seqIdx}.img_w = 352;   seqs{seqIdx}.img_h = 288 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% benchmark dataset 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% seqs{seqIdx}.seqName = 'Bird2';           seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 99   ;   seqs{seqIdx}.img_w = 720;   seqs{seqIdx}.img_h = 400 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'BlurCar1';        seqs{seqIdx}.startFrame = 248;    seqs{seqIdx}.endFrame = 988  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'BlurCar3';        seqs{seqIdx}.startFrame = 4  ;    seqs{seqIdx}.endFrame = 359  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'BlurCar4';        seqs{seqIdx}.startFrame = 19 ;    seqs{seqIdx}.endFrame = 397  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Board';           seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 698  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Bolt2';           seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 293  ;   seqs{seqIdx}.img_w = 480;   seqs{seqIdx}.img_h = 270 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Boy';             seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 602  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Car2';            seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 913  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Car24';           seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 3059 ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Coke';            seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 291  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Coupon';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 327  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Crossing';        seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 120  ;   seqs{seqIdx}.img_w = 360;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Dancer';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 225  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 246 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Dancer2';         seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 150  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 262 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'David2';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 536  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'David3';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 252  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Dog';             seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 127  ;   seqs{seqIdx}.img_w = 352;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Dog1';            seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 1350 ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Doll';            seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 3872 ;   seqs{seqIdx}.img_w = 400;   seqs{seqIdx}.img_h = 300 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'FaceOcc1';        seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 892  ;   seqs{seqIdx}.img_w = 352;   seqs{seqIdx}.img_h = 288 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'FaceOcc2';        seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 812  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Fish';            seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 476  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'FleetFace';       seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 707  ;   seqs{seqIdx}.img_w = 720;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Football1';       seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 81   ;   seqs{seqIdx}.img_w = 352;   seqs{seqIdx}.img_h = 288 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Freeman1';        seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 326  ;   seqs{seqIdx}.img_w = 360;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Freeman3';        seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 474  ;   seqs{seqIdx}.img_w = 360;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Girl2';           seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 1500 ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Gym';             seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 767  ;   seqs{seqIdx}.img_w = 426;   seqs{seqIdx}.img_h = 234 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Human2';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 1128 ;   seqs{seqIdx}.img_w = 480;   seqs{seqIdx}.img_h = 640 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Human5';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 713  ;   seqs{seqIdx}.img_w = 480;   seqs{seqIdx}.img_h = 640 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Human7';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 250  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Human8';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 128  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Jogging';         seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 307  ;   seqs{seqIdx}.img_w = 352;   seqs{seqIdx}.img_h = 288 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'KiteSurf';        seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 84   ;   seqs{seqIdx}.img_w = 480;   seqs{seqIdx}.img_h = 272 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Lemming';         seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 1336 ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Man';             seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 134  ;   seqs{seqIdx}.img_w = 241;   seqs{seqIdx}.img_h = 193 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Mhyang';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 1490 ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'MountainBike';    seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 228  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 360 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Rubik';           seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 1997 ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Singer1';         seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 351  ;   seqs{seqIdx}.img_w = 624;   seqs{seqIdx}.img_h = 352 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Skater';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 160  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Skater2';         seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 435  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 262 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Subway';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 175  ;   seqs{seqIdx}.img_w = 352;   seqs{seqIdx}.img_h = 288 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Suv';             seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 945  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Tiger1';          seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 354  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 480 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Toy';             seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 271  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Trans';           seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 124  ;   seqs{seqIdx}.img_w = 640;   seqs{seqIdx}.img_h = 332 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Twinnings';       seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 472  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
% seqs{seqIdx}.seqName = 'Vase';            seqs{seqIdx}.startFrame = 2  ;    seqs{seqIdx}.endFrame = 271  ;   seqs{seqIdx}.img_w = 320;   seqs{seqIdx}.img_h = 240 ;   seqs{seqIdx}.qp = qp;    seqIdx = seqIdx + 1;
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



