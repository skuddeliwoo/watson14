function hebb = calcHebb(wat)
%--------------------------------------------------------------------------
% calcHebb:
% [insert description]
%--------------------------------------------------------------------------
% meanMagnitudeOfResultForScale als Platzhalter
hebb = meanMagnitudeOfResultForScale * wat.target * wat.target'
end

