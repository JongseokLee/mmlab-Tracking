function newParticleStates = propagate( particleStates, sNoise, blockWise,target_motion )

%
% This function propages a state according to a simple
% dynamical model.
%
%
% Input:
% particleStates - original states to propagate
% sNoise - a vector containg the variances of the different state features
%
% Output:
% newParticleStates - updated states that have been propagated
%

nParticles = size(particleStates,1);
newParticleStates = zeros(size(particleStates));
motion_hor = target_motion.hor;
motion_ver = target_motion.ver;
transM = [    1 0 1 0 0 0 0;
    0 1 0 1 0 0 0;
    0 0 1 0 0 0 0;
    0 0 0 1 0 0 0;
    0 0 0 0 1 0 0;
    0 0 0 0 0 1 0;
    0 0 0 0 0 0 1];

blk_w = blockWise(2);
blk_h = blockWise(1);

parfor i=1:nParticles
    
    pState = particleStates(i,:);
    
    pState(2) = pState(2) - motion_hor;
    pState(1) = pState(1) - motion_ver;
    
    tState = transM * pState';
    
    noise = randn(1,7) .* sNoise;
    
    tState = tState' + noise;
    [ ~, top, bottom, left, right, ~, ~ ] = getRecState( tState ,blockWise);
    
    if top < 1
        bottom = min(bottom + (1 - top), blockWise(1));
        top = 1;
        tState(3) =  -tState(3);
    end
    if  bottom > blockWise(1)
        top = max(top - (bottom - blockWise(1)),1);
        bottom = blockWise(1);
        tState(3) =  -tState(3);
    end
    
    if left < 1
        right = min(right + (1 - left), blockWise(2));
        left = 1 ;
        tState(4) =  -tState(4);
    end
    if right > blockWise(2)
        left = max(left - (right - blockWise(2) ),1);
        right = blockWise(2);
        tState(4) =  -tState(4);
    end
    %     top    = min(blk_h, max(1, top));
    %     bottom = max(1, min(blk_h, bottom));
    %     left   = min(blk_w, max(1, left));
    %     right  = max(1, min(blk_w, right));
    h = max(2, min(blk_h, bottom-top+1));
    w = max(2, min(blk_w, right-left+1));
    %      h = bottom-top+1;
    %      w = right-left+1;
    
    dHx = floor(h/2);
    dHy = floor(w/2);
    dx = top + dHx - 1 ;
    dy = left + dHy - 1;
    dvx = tState(3); dvy = tState(4); dsc = tState(7);
    tState = [dx,dy,dvx,dvy,dHx,dHy,dsc];
    tState = round(tState);
    
    
    %     %enforce maximas
    %     if tState(1)<1 , tState(1)=1 ;end
    %     if tState(1)>height , tState(1)=height ;end
    %     if tState(2)<1 , tState(2)=1 ;end
    %     if tState(2)>width , tState(2)=width ;end
    %
    %     vmax = 10;
    %     if tState(3)<-vmax , tState(3)=-vmax ;end
    %     if tState(3)>vmax , tState(3)=vmax ;end
    %     if tState(4)<-vmax , tState(4)=-vmax ;end
    %     if tState(4)>vmax , tState(4)=vmax ;end
    %
    %     if tState(7)<-0.1 , tState(7)=-0.1 ;end
    %     if tState(7)>0.1 , tState(7)=0.1 ;end
    
    newParticleStates(i,:) = tState;
    
end

%[SS S]