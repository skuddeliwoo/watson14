function calcHebb(con)
%--------------------------------------------------------------------------
% calcHebb: calculation of Hebbs matrix according to Watson2014
%--------------------------------------------------------------------------
% get the mean magnitude of grns for the scaling of the Hebb matrix
meanMag = mean(abs(con.pop.grn(:)));
% calculate Hebb matrix
con.hebb = meanMag * con.target * con.target';
end

