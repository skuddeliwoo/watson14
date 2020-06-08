function sortedGrns = sortByDistance(wat)
%--------------------------------------------------------------------------
% sortByDistance: sort method for gene regulation networks. They get sorted
% by their ascending distances to the Hebb matrix
%--------------------------------------------------------------------------
% calculate the distances of grns to hebb matrix
distanceSum = sum(abs(wat.hebb - wat.grn), [1,2]);
% get the sorted indices in ascending order
[~, sortedIndices] = sort(distanceSum);
% output the grns in ascending order
sortedGrns = wat.grn(:,:,sortedIndices);
end

