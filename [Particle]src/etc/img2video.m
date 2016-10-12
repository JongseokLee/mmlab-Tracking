close all;
clear all;
clc;

fileType = 'png';

currentFolder  = pwd;
files = dir(currentFolder);

fcnt = 1;
for id=1:size(files,1)
    
    num = sscanf(files(id).name,'%d');
    
    if isempty(num) == 0
        img = imread(files(id).name);
        mov_in(fcnt) = im2frame(img);
        fcnt = fcnt + 1;
    end
end

if fcnt > 0
    movie2avi(mov_in, 'mask.avi', 'compression', 'None', 'fps', 30);
    disp('done!');
end