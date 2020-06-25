function pop = develop(pop, nDevSteps, fMagFactor, fDecayRate)
%--------------------------------------------------------------------------
% develop: model the ontogenetic trajectory of the population
% starting from the genotype, (P(0) = G), the phenotype develops over time
% as in P(t+1) = P(t) + tau1 * tanh(B * P(t)) - tau2 * P(t), with
% - tau1: fMagFactor, defines the magnitude of developmental bias
% - tau2: fDecayRate, defines the decay rate (from Watson 2014)
%--------------------------------------------------------------------------
% (P(0) = G)
pop.phenotype = pop.genotype;

% iteration through timesteps
for step = 1:nDevSteps
    prod = zeros(pop.nTrait, pop.nPop);
    % iteration for faster calculations (conversion to cells possible but
    % inefficient)
    for individual = 1:pop.nPop
        prod(:, individual) =...
            pop.grn(:,:,individual) * pop.phenotype(:,individual);
    end
    pop.phenotype = pop.phenotype...
        + fMagFactor * (tanh(prod))...
        - fDecayRate * pop.phenotype;
    
    
    % cap magnitude of phenotype at +- 1 (to avoid problems with fitness
    % calculation later on)
    pop.phenotype(pop.phenotype > 1) = 1;
    pop.phenotype(pop.phenotype < -1) = -1;
end
end
