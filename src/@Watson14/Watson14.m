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
        function wat = Watson14(nGen, nPop, nTrait)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            wat.genotype = zeros(nTrait, nPop);
            wat.grNetwork = zeros(nTrait, nTrait, nPop);
            wat.phenotype = zeros(nTrait, nPop);
            wat.nGen = nGen;
            wat.nTrait = nTrait;
            wat.nPop = nPop;
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
