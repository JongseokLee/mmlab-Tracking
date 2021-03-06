function back_feature = get_MV_BF(mag,max_mag,angle, state,blockWise,bins)

[~, t, b, l, r] = getRecState(state,blockWise);

if t < 1
    b = min(b + 1 - t, blockWise(1));
    t = 1;
end
if  b > blockWise(1)
    t = max(t - (b - blockWise(1)),1);
    b = blockWise(1);
end

if l < 1
    r = min(r + 1 - l , blockWise(2));
    l = 1;
end

if r > blockWise(2)
    l = max(l - (r - blockWise(2) ),1);
    r = blockWise(2);
end
% for i = t : b
%     for j = l : r
%         K(i-t+1,j-l+1) = abs(i-state(1))+abs(j-state(2)); %% manhattan distance
% %           K(i-t+1,j-l+1) = ((i-state(1))^2)+(j-state(2)^2);
% %         K(i-t+1,j-l+1) = max(abs(i-state(1)),abs(j-state(2)));
%     end
% end

mag_ = mag(t:b,l:r);
angle_ = angle(t:b,l:r);

[rows, cols] = size(angle_);


angle_ = reshape(angle_, rows*cols,1);
angle_ = floor(angle_/(2*pi/bins))+1;
back_feature = hist(angle_,bins);

mag__   = reshape(mag_, rows*cols,1);
mag__ = floor(mag__/((max_mag*1.01)/bins))+1;
back_feature_2 = hist(mag__,bins);
back_feature = [back_feature back_feature_2]';

% K=reshape(K,rows*cols,1);
% K=K/(sum(K));
% ang_hist = zeros(1,bins);
% amp_hist = zeros(1,bins);
% for i = 1 : rows*cols
%     ang_hist(1,angle_(i)) = ang_hist(1,angle_(i))+K(i);
%     amp_hist(1,mag__(i)) = amp_hist(1, mag__(i))+K(i);
% end
    
% back_feature = [ang_hist amp_hist];
% back_feature = [ang_hist];