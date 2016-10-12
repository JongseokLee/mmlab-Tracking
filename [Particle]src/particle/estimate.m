function meanstate  = estimate( S,W )

%ESTIMATE will return a new estimate of the mean state.
%The returned state will then used to update the target
%model for the next iteration.

N = size(S,1);

meanstate = zeros(1,size(S,2));
% A = [ W W W W W W W ];
% meanstate = S.*A;
% meanstate = sum(meanstate);
% nanFlag = isnan(W); 
% index   = find(nanFlag==1);
% W(index) = [];
% W = W / sum(W);
parfor i=1:size(W,1)
    
    meanstate = meanstate + W(i) * S(i,:,1);    
    
end
% meanstate(5) = meanstate(5)*(1+similarity/4);
% meanstate(6) = meanstate(6)*(1+similarity/4);
meanstate = floor(meanstate);
