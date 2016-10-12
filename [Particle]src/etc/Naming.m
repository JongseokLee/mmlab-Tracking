close all;
clear all;
clc;

fileType = 'bmp';

currentFolder  = pwd;
files = dir(currentFolder);

for id=1:size(files,1)
    
    num = sscanf(files(id).name,'%d');
    
    if isempty(num) == 0
        movefile(files(id).name, strcat(sprintf('%04d', num), '.', fileType));
    end
    
end