function [x,w] = rs_systematic(x,w,N)
%RS_SYSTEMATIC systematic resampling
%
% [X,W] = RS_SYSTEMATIC(X,W) resamples the states X
% and their associated weights W using systematic
% sampling .
%
% [X,W]=RS_SYSTEMATIC(X,W,N) returns a resampled
% distribution of size N.

% Copyright (C) 2005  Jeroen Hol
%
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public License
% as published by the Free Software Foundation; either version 2
% of the License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

% check inputs
if nargin<3
    N = length(w) ;
end

% generate ordered uniform numbers
u = ([0:N-1]+rand(1))/N;

% generatate cumulative weights (ordered)
wc = cumsum(w);

% indices of the selected states
ind = zeros(1,N);
k = 1;
for i = 1:N
    while (wc(k,1)<u(i))
        k = k + 1;
    end
    ind(i)=k;
end;
x = x(ind,:);
% create new states and corresponding weights

w = ones(1,N)./N;

