function [ d ] = bhattadistance( test, ref )
%BHATTADISTANCE returns a scalar value that is the
%Bhattacharyya distance between two distributions

d = sum(sqrt(test.*ref));
% average distance over the three distributions?
% mul = 1;
% for i =1 :length(d)
%     mul = mul * d(i);
% end
d =sum(d)/length(d);
d = sqrt(1-d);


