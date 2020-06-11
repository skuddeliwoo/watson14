classdef Population
    %POPULATION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        nPop
        nTrait
        genotype
        grn                     % gene regulation network
        phenotype
    end
    
    methods
        function pop = Population(nPop, nTrait)
            %POPULATION Construct an instance of this class
            %   Detailed explanation goes here
            pop.nTrait = nTrait;
            pop.nPop = nPop;
            pop.genotype = zeros(nTrait, nPop);
            pop.grn = zeros(nTrait, nTrait, nPop);
            pop.phenotype = zeros(nTrait, nPop);
        end
        
        pop = develop(pop, nDevSteps, fMagFactor, fDecayRate);  % development from G -> P
        pop = mutate(pop, fMutMagCapGene, fMutMagCapGRN);
        pop = recombine(pop, fitness);
    end
end

