function [particleStates, weights] = initParticles( targetState, nParticles, param, blockWise )
%INITPARTICLES creates the initial sets of particles

% Inputs:
% targetState - initial target that we want to track,
% this function creates a set of samples around
% target that all have a uniform weight
% nParticles - number of particles

% Outputs:
% particleStates - set of particles
% weights - set of weights (all initialized at 1/N)
% 

% the state of the target 
% NOTE : x-axis is vertical in this case
% state = [ x, y, vx, vy, Hx, Hy, sc]
% [x,y] - centroid of the target
% [vx,vy] - velocities
% [Hx,Hy] - size of the target (for now a rectangle, maybe an ellispe in the future)
% sc - scaling factor


particleStates = zeros(nParticles,7,1);
blk_h = blockWise(1);
blk_w = blockWise(2);

delta_max = param;
for i=1:nParticles
    %uniformly distribute vx,vy,sc
    delta = -delta_max + 2*delta_max .* rand(size(delta_max,1),1);
    delta(1) = round(delta(1));
    delta(2) = round(delta(2));    
    %create sample
    dx = targetState(1) + delta(1);
    dy = targetState(2) + delta(2);
    dvx = delta(1);
    dvy = delta(2);
    dHx = round(targetState(5)*(1+delta(3)));
    dHy = round(targetState(6)*(1+delta(3)));   
    dsc = delta(3);
    pState = [dx,dy,dvx,dvy,dHx,dHy,dsc];
    
    [ ~, top, bottom, left, right, ~, ~ ] = getRecState( pState , blockWise );
    
    top    = min(blk_h, max(1, top));
    bottom = max(1, min(blk_h, bottom));
    left   = min(blk_w, max(1, left));
    right  = max(1, min(blk_w, right));
    
    h = bottom-top+1;
    w = right-left+1;
    
    dHx = floor(h/2);
    dHy = floor(w/2);
    dx = top + dHx - 1;
    dy = left + dHy - 1;
    pState = [dx,dy,dvx,dvy,dHx,dHy,dsc];
    
    particleStates(i,:,1) = pState;

end

% initial weight 1/N to set W
weights = ones(nParticles,1) * (1/nParticles);