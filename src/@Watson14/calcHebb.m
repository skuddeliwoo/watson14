function hebb = calcHebb(wat)
%--------------------------------------------------------------------------
% calcHebb:
% [insert description]
%--------------------------------------------------------------------------
hebb = meanMagnitudeOfResultForScale * wat.target * wat.target'
end

