function [ hist ] = histo_mv( mv, bins )

% histo returns a bins x 3 matrix that contains the 
% distribution for the RGB space of the image im. 
% The further away points are from y, the less they contribute
% to the distribution. The distribution are normalized so that
% they can be seen as probability distributions.

% inputs:
% im - RGB image we are seeking the histogram from 
% y - (Center) 2x1 point that we use for weighting the histogram
% a - factor to influence the weighting by adapting the size of the region
% bins - Number of bins for the histogram

[rows,cols] = size(mv);
% adapt size of the region
a = norm([rows,cols]);
y = round([rows,cols]/2);

% kernel
k = zeros(rows,cols);

for i=1:rows
    for j=1:cols
        k(i,j) = 1- (norm([i,j]-y)/a)^2;
        if k(i,j)<0
            y
            n = norm([i,j]-y)
            a = a
            k = k(i,j)
            error('no good, kernel is negative, make "a" bigger or set k(i,j) to zero');
        end
    end
end

% for every color RGB 
hist = zeros(bins,1);
% binsf = 2*pi/(bins-2);

k = ones(rows,cols);

for i=1:rows
    for j=1:cols
   
        w = k(i,j);
        
        rbin = 1+ floor(double(mv(i,j))/binsf);
%         rbin = 1+ floor(double(mv(i,j)));
        hist(rbin,1) = hist(rbin,1)+w;

    end
end

f = sum(sum(k));

hist = hist/f;



