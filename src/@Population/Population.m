classdef Population
%--------------------------------------------------------------------------
% Population:
%
%--------------------------------------------------------------------------
    
    properties
        nPop                    % amount of individuals
        nTrait                  % amount of traits per individual
        genotype                % numerical value with range: [-1 , 1]
        grn                     % gene regulation network with range: [-1 , 1]
        phenotype               % numerical value with range: [-1 , 1]
        savedPhenos
    end
    
    methods
        % constructor
        function pop = Population(nPop, nTrait, nGen)
            pop.nTrait = nTrait;
            pop.nPop = nPop;
            pop.genotype = zeros(nTrait, nPop);
            pop.grn = zeros(nTrait, nTrait, nPop);
            pop.phenotype = zeros(nTrait, nPop);
            pop.savedPhenos = zeros(nTrait, nPop, nGen);
        end
        
        % functions
        pop = develop(pop, nDevSteps, fMagFactor, fDecayRate, generation);  % development from G -> P
        pop = mutate(pop, fMutMagCapGene, fMutMagCapGRN);
        pop = recombine(pop, fitness);
    end
end

