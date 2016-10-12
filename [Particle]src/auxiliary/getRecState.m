function [ rec, top, bottom, left, right, width, height ] = getRecState( state , blockWise )

% rec = [top, bottom, left, right]

% NOTE : x-axis is vertical in this case
% state = [ x, y, vx, vy, Hx, Hy, sc]
% [x,y] - centroid of the target
% [vx,vy] - velocities
% [Hx,Hy] - size of the target (for now a rectangle, maybe an ellispe in the future)
% sc - scaling factor

top = (state(1) - state(5)+1);

bottom =state(1) + state(5)+1;

left =(state(2) - state(6)+1);

right =  state(2) + state(6)+1;

top = max(1,min(blockWise(1),top));
bottom = max(1,min(blockWise(1),bottom));
left = max(1,min(blockWise(2),left));
right = max(1,min(blockWise(2),right));

rec = [top, bottom, left, right];
        
width = right - left + 1;
height = bottom - top + 1;