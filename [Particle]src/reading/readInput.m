function [predMode, puSize, tuSize, coeff_ori, mv, dmv] = readInput(inputPathes, tframe, imsize, blk_size)

dataType = 'int16';
dataSize = 2;

pelPrecision = 4; % quarter-pel precision MV
img_h = imsize(1); img_w = imsize(2);
blockWise = [img_h/blk_size img_w/blk_size];

%-Load input data
path = inputPathes.predMode;
fin = fopen(path, 'r');
fseek(fin, img_w*img_h * dataSize * (tframe-1),'bof');
data = fread(fin, [img_w,img_h], dataType)';
fclose(fin);

%-Check the size
data_w = size(data, 2); data_h = size(data, 1);

if(data_w ~= img_w || data_h ~= img_h)
    error('predMode dimension is different!\n');
end
data = imresize(data, blockWise,'nearest');
predMode = data;

%-Load input data
path = inputPathes.PuSize;
fin = fopen(path, 'r');
fseek(fin, img_w*img_h * dataSize * (tframe-1),'bof');
data = fread(fin, [img_w,img_h], dataType)';
fclose(fin);

%-Check the size
data_w = size(data, 2); data_h = size(data, 1);

if(data_w ~= img_w || data_h ~= img_h)
    error('PuSize dimension is different!\n');
end
data = imresize(data, blockWise,'nearest');
puSize = data;

% %-Load input data
% path = inputPathes.TuSize;
% fin = fopen(path, 'r');
% fseek(fin, img_w*img_h * dataSize * (tframe-1),'bof');
% data = fread(fin, [img_w,img_h], dataType)';
% fclose(fin);
% 
% %-Check the size
% data_w = size(data, 2); data_h = size(data, 1);
% 
% if(data_w ~= img_w || data_h ~= img_h)
%     error('TuSize dimension is different!\n');
% end
% data = imresize(data, blockWise,'nearest');
% tuSize = data;
tuSize=0;
% %-Load input data
% path = inputPathes.coeff;
% fin = fopen(path, 'r');
% fseek(fin, img_w*img_h * dataSize * (tframe-1),'bof');
% data = fread(fin, [img_w,img_h], dataType)';
% fclose(fin);
% 
% %-Check the size
% data_w = size(data, 2); data_h = size(data, 1);
% 
% if(data_w ~= img_w || data_h ~= img_h)
%     error('DCT_coeff_ori dimension is different!\n');
% end
% coeff_ori = data;
coeff_ori=0;
%-Load input data
path = inputPathes.MV.hor;
fin = fopen(path, 'r');
fseek(fin, img_w*img_h * dataSize * (tframe-1),'bof');
data = fread(fin, [img_w,img_h], dataType)';
fclose(fin);

%-Check the size
data_w = size(data, 2); data_h = size(data, 1);

if(data_w ~= img_w || data_h ~= img_h)
    error('MV.hor dimension is different!\n');
end
data = imresize(data, blockWise,'nearest');
mv.hor = round(data/pelPrecision);
dmv.hor = data/pelPrecision;
%-Load input data
path = inputPathes.MV.ver;
fin = fopen(path, 'r');
fseek(fin, img_w*img_h * dataSize * (tframe-1),'bof');
data = fread(fin, [img_w,img_h], dataType)';
fclose(fin);

%-Check the size
data_w = size(data, 2); data_h = size(data, 1);

if(data_w ~= img_w || data_h ~= img_h)
    error('MV.ver dimension is different!\n');
end
data = imresize(data, blockWise,'nearest');
mv.ver = round(data/pelPrecision);
dmv.ver = data/pelPrecision;