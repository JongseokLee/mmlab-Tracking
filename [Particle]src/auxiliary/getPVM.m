% Written by S. Hossein Khatoonabadi (skhatoon@sfu.ca)
% Modified by D.K Lee (dongkyu@media.kw.ac.kr)
%
%
% Polar Vector Median (PVM)
%
% input
%   mv.hor              horizontal component of motion vector in the list
%   mv.ver              vertical component of motion vector in the list
%
% output
%   pvm.hor 			horizontal component of PVM motion vector
%   pvm.ver 			vertical component of PVM motion vector

function [pvm] = getPVM(mv, ZERO_LEN_LIMIT_POW2)

% threshold for squared MV length limit
% ZERO_LEN_LIMIT_POW2 = 0.0;

% squared MV length calculation
lengths = mv.hor.^2 + mv.ver.^2;

% discard MVs with zero or close to zero length
mv.hor = mv.hor(lengths > ZERO_LEN_LIMIT_POW2);
mv.ver = mv.ver(lengths > ZERO_LEN_LIMIT_POW2); 

% PVM length calculation (median of lengths)
length_PVM = median(lengths)^.5;

if length(mv.hor) > 1
    % angle calculation
    angles = atan2(mv.ver, mv.hor);
    indexes = angles == -abs(atan2(0,-1));
    angles(indexes) = abs(angles(indexes));
    sortedAngles = sort(angles);
    
    % difference angle calculation in clockwise direction
    dif = zeros(size(sortedAngles));
    dif(1:end-1) = sortedAngles(2:end)-sortedAngles(1:end-1);
    dif(end) = 2*pi-sum(dif(1:end-1));
    
    count = length(dif);
    halfNum = floor(length(dif)/2);     % the number of the half of the MVs
    
    % find an MV group having the minimum summed angle
    s = sum(dif(1:halfNum-1));
    minSum = s;
    indexSum = 1;
    
    for k=halfNum:count
        s = s + dif(k)-dif(k-halfNum+1);
        if s < minSum
            minSum = s;
            indexSum = k-halfNum+2;     
            if minSum == 0
                break
            end
        end
    end
    
    % PVM angle calculation (median angle of the selected MV group)
    if mod(halfNum,2) ~= 0
        angle = sortedAngles(indexSum+(halfNum-1)/2);
    else
        angle = (sortedAngles(indexSum+(halfNum-2)/2) + sortedAngles(indexSum+halfNum/2))/2;
    end
elseif isempty(mv.hor)
    length_PVM = 0;
    angle = 0;
else
    length_PVM = sqrt(mv.ver^2 + mv.hor^2);
    angle = atan2(mv.ver, mv.hor);
end

pvm.ver = round(length_PVM*sin(angle));
pvm.hor = round(length_PVM*cos(angle));