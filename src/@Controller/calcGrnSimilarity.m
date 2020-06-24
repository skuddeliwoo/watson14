function grnSimilarity = calcGrnSimilarity(con)
%--------------------------------------------------------------------------
% calcGrnSimilarity: calculates similiarty of saved grns to the
% unscaled Hebb matrix for a simple overview of grn development
%--------------------------------------------------------------------------
% initialize matrix before loop for faster access
similarity = zeros(size(con.pop.savedGrn));
for generation = 1:con.nGen
    % similarity is calculated by multiplying elements of the grn with the
    % elements of the hebb matrix
   similarity(:, :, :, generation) = con.pop.savedGrn(:, :, :, generation) .* con.hebb;
end
grnSimilarity = reshape( ...
            mean( sum( similarity, [1 2]) , 3), ...
                [con.nGen, 1] );
end

