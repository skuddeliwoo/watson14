function calcHebb(wat)
%--------------------------------------------------------------------------
% calcHebb: calculation of Hebbs matrix according to Watson2014
%--------------------------------------------------------------------------
% get the mean magnitude of grns for the scaling of the Hebb matrix
meanMag = mean(abs(wat.grn(:)));
% calculate Hebb matrix
wat.hebb = meanMag * wat.target * wat.target';
end

