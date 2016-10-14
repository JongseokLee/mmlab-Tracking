function [ rec, t, b, l, r, width, height ] = getRecState( state , blockWise )

% rec = [top, bottom, left, right]

% NOTE : x-axis is vertical in this case
% state = [ x, y, vx, vy, Hx, Hy, sc]
% [x,y] - centroid of the target
% [vx,vy] - velocities
% [Hx,Hy] - size of the target (for now a rectangle, maybe an ellispe in the future)
% sc - scaling factor

t = (state(1) - state(5)+1);

b =state(1) + state(5)+1;

l =(state(2) - state(6)+1);

r =  state(2) + state(6)+1;
if t < 1
    b = min(b + 1 - t, blockWise(1));
    t = 1;
end
if  b > blockWise(1)
    t = max(t - (b - blockWise(1)),1);
    b = blockWise(1);
end

if l < 1
    r = min(r + 1 - l , blockWise(2));
    l = 1;
end

if r > blockWise(2)
    l = max(l - (r - blockWise(2) ),1);
    r = blockWise(2);
end
% top = round(max(1,min(blockWise(1),top)));
% bottom = round(max(1,min(blockWise(1),bottom)));
% left =round( max(1,min(blockWise(2),left)));
% right =round( max(1,min(blockWise(2),right)));

rec = [t, b, l, r];
        
width = r - l + 1;
height = b - t + 1;