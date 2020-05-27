classdef Watson14 < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        nGen
        nPop
        nTraits
        G
        B
        P
    end
    
    methods
        function wat = Watson14(nGen, nPop, nTraits)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            wat.G = zeros(1, nTraits, nPop);
            wat.B = zeros(nTraits, nTraits, nPop);
            wat.P = zeros(1, nTraits, nPop);
            wat.nGen = nGen;
        end
        
        wat = mutate(wat);
        wat = recombine(wat);
        wat = simulate(wat);
    end
end
