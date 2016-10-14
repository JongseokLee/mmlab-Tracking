function [ d ] = mv_bhattadistance( test, ref )
%BHATTADISTANCE returns a scalar value that is the
%Bhattacharyya distance between two distributions

d = sqrt(test.*ref);
% average distance over the three distributions?


d = sum(d);

d = sqrt(1.001 - d);


