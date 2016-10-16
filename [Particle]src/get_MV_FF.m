function fore_feature = get_MV_FF(mag,max_mag,angle, state,blockWise,bins)

[~, t, b, l, r] = getRecState(state,blockWise);

% if t < 1
%     b = min(b + 1 - t, blockWise(1));
%     t = 1;
% end
% if  b > blockWise(1)
%     t = max(t - (b - blockWise(1)),1);
%     b = blockWise(1);
% end
% 
% if l < 1
%     r = min(r + 1 - l , blockWise(2));
%     l = 1;
% end
% 
% if r > blockWise(2)
%     l = max(l - (r - blockWise(2) ),1);
%     r = blockWise(2);
% end

for i = t : b
    for j = l : r
%         K(i-t+1,j-l+1) = max(abs(i-state(1)),abs(j-state(2)));
        K(i-t+1,j-l+1) = abs(i-state(1))+abs(j-state(2));
    end
end

mag_ = mag(t:b,l:r);
angle_ = angle(t:b,l:r);

[rows, cols] = size(angle_);

mag__   = reshape(mag_, rows*cols,1);
mag__ = floor(mag__/((max_mag*1.01)/bins))+1;
angle_ = reshape(angle_, rows*cols,1);
angle_ = floor(angle_/(2*pi/bins))+1;
K=reshape(K,rows*cols,1);
K = max(K)-K;
K=K/(2*sum(K));


ang_hist = zeros(bins,1); 
amp_hist = zeros(bins,1);
for i = 1 : rows*cols
    ang_hist(angle_(i),1) = ang_hist(angle_(i),1)+K(i);
    amp_hist(mag__(i),1) = amp_hist(mag__(i),1)+K(i);
end
 
fore_feature = [ang_hist; amp_hist];
% fore_feature = [ang_hist];