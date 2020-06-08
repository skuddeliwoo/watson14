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
        grn                     % gene regulation network
        phenotype
        target                  % target phenotype (selective enviroment)
        hebb
    end
    
    methods
        function wat = Watson14(nGen, nPop, nTrait)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            wat.genotype = zeros(nTrait, nPop);
            wat.grn = zeros(nTrait, nTrait, nPop);
            wat.phenotype = zeros(nTrait, nPop);
            wat.nGen = nGen;
            wat.nTrait = nTrait;
            wat.nPop = nPop;
            wat.target = rand(nTrait, 1);
                wat.target( wat.target < 0.5 ) = -1;
                wat.target( wat.target >= 0.5) =  1;
        end
        
        fit = calcFitness(wat);
        calcHebb(wat);
        depict(wat);              % graphical output of sim
        develop(wat, nDevSteps, fMagFactor, fDecayRate);  % development from G -> P
        mutate(wat, fMutMagCapGene, fMutMagCapGRN);
        recombine(wat);
        simulate(wat);            % manages simulation process
        sortedGrns = sortByDistance(wat);
        
    end
end
