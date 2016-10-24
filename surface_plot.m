alpa  = 0.75;
sigma = 0.07;
for i = 1 : 1001
    for j = 1: 1001
        w(i,j) = exp(-((((i-1)/1000).^alpa).*(((j-1)/1000).^(1-alpa)))/(2*sigma));
    end
end
figure(10); mesh(0 : 0.001 : 1,0 : 0.001 : 1,w);