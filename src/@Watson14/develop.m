function develop(wat, nDevSteps, fMagFactor, fDecayRate)
%--------------------------------------------------------------------------
% develop: model the ontogenetic trajectory of the population
% starting from the genotype, (P(0) = G), the phenotype develops over time
% as in P(t+1) = P(t) + tau1 * tanh(B * P(t)) - tau2 * P(t), with
% - tau1: fMagFactor, defines the magnitude of developmental bias
% - tau2: fDecayRate, defines the ___???___
%--------------------------------------------------------------------------

% (P(0) = G)
wat.phenotype = wat.genotype;
tic
for step = 1 : nDevSteps
    % transfer GRN and phenotypes into cells for more elegant computing
    cellGRN = mat2cell(wat.grNetwork, wat.nTrait, wat.nTrait, ones(1, wat.nPop));
    cellGRN = permute(cellGRN, [1,3,2]);
    cellPheno = mat2cell(wat.phenotype, wat.nTrait, ones(1, wat.nPop));
    
    % calculate B * P(t), and transfer back into a matrix
    prod = cell2mat(cellfun(@mtimes, cellGRN, cellPheno, 'UniformOutput', false));
    
    % calculate next phenotype for this developmental time step
    wat.phenotype = wat.phenotype + fMagFactor * (tanh(prod)) - fDecayRate * wat.phenotype;
    
    % performance overhaul: this implementation transforms phenotypes to
    % cells and back. wouldn't it be faster if we stored it in cells from
    % the beginning?
end
toc

tic
for step = 1:nDevSteps
    prod = zeros(wat.nTrait, wat.nPop);
    for individual = 1:wat.nPop
        prod(:, individual) =...
            wat.grNetwork(:,:,individual) * wat.phenotype(:,individual);
    end
    wat.phenotype = wat.phenotype...
        + fMagFactor * (tanh(prod))...
        - fDecayRate * wat.phenotype;
end
toc
end
