classdef Population
%--------------------------------------------------------------------------
% Population: contains attributes and methods for a set of individuals.
% Only contains methods which directly influences the individuals.
% One individual represents a small group of living beings.
%--------------------------------------------------------------------------
    
%% attributes
properties
    genotype             % numerical value with range: [-1 , 1]
    grn                  % gene regulation network with range: [-1 , 1]
    nPop                 % amount of individuals
    nTrait               % amount of traits per individual
    phenotype            % numerical value with range: [-1 , 1]
end
    
methods
    %% constructor
    function pop = Population(nPop, nTrait)
        pop.nTrait = nTrait;
        pop.nPop = nPop;
        pop.genotype = zeros(nTrait, nPop);
        pop.grn = zeros(nTrait, nTrait, nPop);
        pop.phenotype = zeros(nTrait, nPop);
    end
        
    %% functions
    % development from genotype to phenotype
    pop = develop(pop, nDevSteps, fMagFactor, fDecayRate);
    % mutation of genotype and gene regulation network
    pop = mutate(pop, fMutMagCapGene, fMutMagCapGRN);
    % recombination of genotype and gene regulation network with single
    % crossover
    pop = recombine(pop, fitness);
end
end

