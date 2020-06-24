function pop = develop(pop, nDevSteps, fMagFactor, fDecayRate, generation)
%--------------------------------------------------------------------------
% develop: model the ontogenetic trajectory of the population
% starting from the genotype, (P(0) = G), the phenotype develops over time
% as in P(t+1) = P(t) + tau1 * tanh(B * P(t)) - tau2 * P(t), with
% - tau1: fMagFactor, defines the magnitude of developmental bias
% - tau2: fDecayRate, defines the ___???___
%--------------------------------------------------------------------------
% (P(0) = G)
pop.phenotype = pop.genotype;

for step = 1:nDevSteps
    prod = zeros(pop.nTrait, pop.nPop);
    for individual = 1:pop.nPop
        prod(:, individual) =...
            pop.grn(:,:,individual) * pop.phenotype(:,individual);
    end
    pop.phenotype = pop.phenotype...
        + fMagFactor * (tanh(prod))...
        - fDecayRate * pop.phenotype;
    
    
    % cap magnitude at +- 1
    pop.phenotype(pop.phenotype > 1) = 1;
    pop.phenotype(pop.phenotype < -1) = -1;
end

pop.savedPhenos(:,:,generation) = pop.phenotype;

end
