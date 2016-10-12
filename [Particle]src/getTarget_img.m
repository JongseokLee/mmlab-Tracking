function DT_img = getTarget_img(img, particleStates)

    x = particleStates(2)-particleStates(6);
    if x < 1
        x =1;
    end
    y = particleStates(1)-particleStates(5);
    if y < 1
        y = 1;
    end
    w = 2*particleStates(6)+1;
    if x+w  > size(img,2)
        x = size(img,2)-w;    
    end
    h = 2*particleStates(5)+1;
    if y+h  > size(img,1)
        y = size(img,1)-h;    
    end
    particle_img(:,:,:) = img(y:y+h, x:x+w,:); 
    original = rgb2ycbcr(particle_img);
    Bw = gpuArray.zeros(size(original(:,:,1)));
    
    Bw = original(:,:,1);
    p_edge = edge(Bw,'sobel',0.05);
    DT = bwdist(p_edge,'euclidean');
    M = max(max(DT));
    Dt = zeros(int16(size(DT,1)*1.5),int16(size(DT,2)*1.5));
    Dt(int16(size(DT,1)/2):int16(size(DT,1)/2)+size(DT,1)-1,int16(size(DT,2)/2):int16(size(DT,2)/2)+size(DT,2)-1) = DT(:,:)/M ;
DT_img = Dt;
