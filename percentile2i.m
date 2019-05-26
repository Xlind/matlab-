%º¯Êýpercentile2i¶¨Òå
function I=percentile2i(h,P)
if P<0 || P>1
    error('The percentile must be in the range [0,1].');
end

h=h/sum(h);
C=cumsum(h);
idx=find(C >= P,1,'first');
I=(idx-1)/(numel(h)-1);
end

