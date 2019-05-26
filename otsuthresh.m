%º¯Êýotsuthresh¶¨Òå
function [T, SM] = otsuthresh(h)
h = h/sum(h);
h = h(:); 
i = (1:numel(h))';
P1 = cumsum(h);
m = cumsum(i.*h);
mG = m(end);
sigSquared = ((mG*P1 - m).^2)./(P1.*(1 - P1) + eps);
maxSigsq = max(sigSquared);
T = mean(find(sigSquared == maxSigsq));
T = (T - 1)/(numel(h) - 1);
SM = maxSigsq / (sum(((i - mG).^2) .* h) + eps);
end

