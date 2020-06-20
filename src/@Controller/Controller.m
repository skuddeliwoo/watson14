classdef Controller < handle
%--------------------------------------------------------------------------
% Controller:
% [insert description]
%--------------------------------------------------------------------------
    
    properties (Access = public)
        nPop
        nTrait
        nGen
        target                  % target phenotype (selective enviroment)
        hebb
        pop
    end
    
    methods
        function con = Controller(nGen, nPop, nTrait)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            
            con.nGen = nGen;
            con.nTrait = nTrait;
            con.nPop = nPop;
            con.pop = Population(nPop, nTrait);
            con.target = rand(nTrait, 1);
                con.target( con.target < 0.5 ) = -1;
                con.target( con.target >= 0.5) =  1;
        end
        
        fit = calcFitness(con);
        calcHebb(con);
        depict(con);              % graphical output of sim
        simulate(con);            % manages simulation process
        sortedGrns = sortByDistance(con);
        
    end
end
