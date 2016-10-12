function back_feature = get_MV_feature(mag,max_mag,angle, state,blockWise,bins,Using_bins)

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
for i = t : b
    for j = l : r
        K(i-t+1,j-l+1) = max(abs(i-state(1)),abs(j-state(2)));
    end
end

mag_ = mag(t:b,l:r);
angle_ = angle(t:b,l:r);

[rows, cols] = size(mag_);

mag__   = reshape(mag_, rows*cols,1);
mag__ = round(mag__/(max_mag/bins));
angle_ = reshape(angle_, rows*cols,1);
angle_ = floor((angle_/(2*pi/bins)) + 1);

K=reshape(K,rows*cols,1);
K=K/(2*sum(K));
K = 0.5 - K;
ang_hist = zeros(bins,1);

for i = 1 : rows*cols
    ang_hist(angle_(i)) = ang_hist(angle_(i))+K(i);
end





h = hist(mag__,0:max_mag/bins:max_mag-max_mag/bins);
h_1 = hist(angle_,0:2*pi/bins:2*pi-(2*pi/bins));



if Using_bins < bins
    [temp,originalpos] = sort( h, 'descend' );
    h(originalpos(1:Using_bins)) = temp(1:Using_bins);
    h(originalpos(bins-Using_bins+1:bins)) = 0;

    [temp,originalpos] = sort( h_1, 'descend' );

    h_1(originalpos(1:Using_bins)) = temp(1:Using_bins);
    h_1(originalpos(bins-Using_bins+1:bins)) = 0;
end
h = h/(2*sum(h));
h_1 = h_1/(sum(h_1)*2);
% 
% figure(91);bar(h_1,'FaceColor',[0 1 0]); axis([0 9 0 .5]);
% figure(98);bar(h,'FaceColor',[1 0 0]); axis([0 9 0 .5]);
% figure(90);bar([h h_1],'FaceColor',[0 0 0]); axis([0 17 0 .5]);
% 
% figure(100), imshow(img);
% hold on;
% s = state;
% rec = [s(2)-s(6),s(1)-s(5),2*s(6)+1,2*s(5)+1];
% rectangle('Position',rec,'EdgeColor',[1.0,0.0,0.0],'LineWidth',2);


   
back_feature = [h h_1];