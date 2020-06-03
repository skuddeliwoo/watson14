classdef Watson14 < handle
%--------------------------------------------------------------------------
% Watson14:
% [insert description]
%--------------------------------------------------------------------------
    
    properties (Access = public)
        nGen
        nPop
        nTrait
        genotype
        grNetwork                     % gene regulation network
        phenotype
    end
    
    methods
        function wat = Watson14(nGen, nPop, nTraits)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            wat.genotype = zeros(nTraits, nPop);
            wat.grNetwork = zeros(nTraits, nTraits, nPop);
            wat.phenotype = zeros(nTraits, nPop);
            wat.nGen = nGen;
        end
        
        calcFitness(wat);
        calcHebb(wat);
        depict(wat);              % graphical output of sim
        develop(wat, nDevSteps, fMagFactor, fDecayRate);  % development from G -> P
        mutate(wat);
        recombine(wat);
        simulate(wat);            % manages simulation process
        
    end
end
