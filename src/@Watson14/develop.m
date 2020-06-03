function develop(wat, nDevSteps, fMagFactor, fDecayRate)
%--------------------------------------------------------------------------
% develop:
% [insert description]
%--------------------------------------------------------------------------

wat.phenotype = wat.genotype;

for step = 1 : nDevSteps
       % P(t+1) = P(t) + tau1 * tanh(B x P(t)) - tau2 * P(t)
       % !!! vorläufiger Code. Muss auf Plausibilität geprüft werden !!!
    cellGRN = mat2cell(wat.grNetwork, wat.nTrait, wat.nTrait, ones(1, wat.nPop));
    cellGRN = permute(cellGRN, [1,3,2]);
    cellPheno = mat2cell(wat.phenotype, wat.nTrait, ones(1, wat.nPop));
    
    % Kreuzprodukt macht doch gar keinen Sinn, oder? Sollte es nicht
    % MatMult sein?
    prod = cell2mat(cellfun(@mtimes, cellGRN, cellPheno, 'UniformOutput', false));
    wat.phenotype = wat.phenotype + fMagFactor * (tanh(prod)) - fDecayRate * wat.phenotype;
    
       % mutate here?
end
end

