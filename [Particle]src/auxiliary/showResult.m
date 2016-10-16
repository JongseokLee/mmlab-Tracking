function showResult( img, t ,rec,target_motion)


figure(999), imshow(img);   
title(['Estimated Result for Frame ' num2str(t)]);  drawnow; 
hold on;
figure(999),
rectangle('Position',rec,'EdgeColor',[1.0,0.0,0.0], 'LineWidth', 2.0);drawnow;
hold on;
figure(999),
quiver(rec(1)+rec(3)/2,rec(2)+rec(4)/2,-target_motion.hor*20,-target_motion.ver*20,...
'LineWidth', 3,'Color',[0.0, 1.0, 1.0]); drawnow;
hold off;
