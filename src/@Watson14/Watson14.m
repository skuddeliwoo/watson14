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
            wat.genotype = zeros(1, nTraits, nPop);
            wat.grNetwork = zeros(nTraits, nTraits, nPop);
            wat.phenotype = zeros(1, nTraits, nPop);
            wat.nGen = nGen;
        end
        
        wat = develop(wat);             % development from G -> P
        wat = mutate(wat);
        wat = recombine(wat);
        wat = simulate(wat);            % manages simulation process
    end
end
