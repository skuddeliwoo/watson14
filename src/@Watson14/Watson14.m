classdef Watson14 < handle
%--------------------------------------------------------------------------
% Watson14:
% [insert description]
%--------------------------------------------------------------------------
    
    properties
        nGen
        nPop
        nTraits
        G
        GRP                     % Gene regulation network
        P
    end
    
    methods
        function wat = Watson14(nGen, nPop, nTraits)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            wat.G = zeros(1, nTraits, nPop);
            wat.GRP = zeros(nTraits, nTraits, nPop);
            wat.P = zeros(1, nTraits, nPop);
            wat.nGen = nGen;
        end
        
        wat = mutate(wat);
        wat = recombine(wat);
        wat = simulate(wat);
    end
end
