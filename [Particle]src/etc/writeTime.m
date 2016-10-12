function [totalTime, fps] = writeTime(timePath, time)

fid = fopen([timePath 'time.txt'], 'wt');

time = time(time ~= -1);

totalTime = sum(time);
fps = size(time,1)/totalTime;

fprintf(fid, '# of Frames :\t%d\n', size(time,1));
fprintf(fid, 'Total Time :\t%.3f\n', totalTime);
fprintf(fid, 'FPS :\t%.3f\n\n', fps);

fprintf(fid, '\n\n\n\n');
fprintf(fid, 'Frame\tTime\n\n');
for i = 1:size(time,1);
    fprintf(fid, '%d\t', i);
    fprintf(fid, '%.3f\t', time(i));
    fprintf(fid, '\n');
end
fprintf(fid, '\n');

fclose(fid);


