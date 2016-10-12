function showResult_rect( img, t ,rec)

figure(999), imshow(img);   
title(['Result for Frame ' num2str(t)]);  drawnow; 
figure(999),
rectangle('Position',rec,'EdgeColor',[1.0,0.0,0.0], 'LineWidth', 2.0);drawnow;


