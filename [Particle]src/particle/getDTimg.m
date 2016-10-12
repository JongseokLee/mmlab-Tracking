function DT_img = getDTimg(img)
    
%     Bw =imgaussfilt(gpuArray(img),1.5);
    Bw =imgaussfilt(img,1.5);
    p_edge = edge(Bw,'sobel',0.02);
    
    DT = bwdist(p_edge,'euclidean');
    
    DT = gather(DT);
    
DT_img = DT;


