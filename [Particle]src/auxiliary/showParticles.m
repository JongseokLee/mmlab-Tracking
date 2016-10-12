function showParticles( img, particleStates, flagZeroSize, numFig, figTitle ,weights)

figure(numFig), imshow(img);
title(figTitle);
hold on;

if flagZeroSize
    
    plot(particleStates(:,1), particleStates(:,2), '.');
    
else
    
    for i=1 : size(particleStates,1)
        s = particleStates(i,:);
        rec = [s(2)-s(6),s(1)-s(5),2*s(6)+1,2*s(5)+1];
%         rectangle('Position',rec,'EdgeColor',[0.0,0.0,1.0]);
        plot(s(2),s(1),'ro','LineWidth',1,...
                     'MarkerEdgeColor','k',...
                     'MarkerFaceColor','r',...
                     'MarkerSize',(weights(i,1)*size(particleStates,1)*5)+0.001);
%       plot(s(2),s(1),'ro','LineWidth',1,...
%          'MarkerEdgeColor','r',...
%          'MarkerFaceColor','r',...
%          'MarkerSize',2);
    end
    
end