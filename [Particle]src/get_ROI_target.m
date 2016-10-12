function ROI_img = get_ROI_target(img, targetState)

    x = targetState(2)-targetState(6);
    if x < 1
        x =1;
    end
    y = targetState(1)-targetState(5);
    if y < 1
        y = 1;
    end
    w = 2*targetState(6)+1;
    if x+w  > size(img,2)
        x = size(img,2)-w;    
    end
    h = 2*targetState(5)+1;
    if y+h  > size(img,1)
        y = size(img,1)-h;    
    end
    
ROI_img = img(y:y+h, x:x+w);


