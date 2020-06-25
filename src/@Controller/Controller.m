classdef Controller < handle
%--------------------------------------------------------------------------
% Controller: provides utility functions for 'Population.m' and methods to
% analyse and picture results
%--------------------------------------------------------------------------
        
    %% attributes
    properties (Access = public)
        nPop                    % amount of individuals
        nTrait                  % amount of traits per individual
        nGen                    % amount of generations
        target                  % target phenotype (selective enviroment)
        hebb                    % Hebb matrix
        pop                     % handle on 'Population.m'
        savedGrn                % saved grns for each generation
        
    end
    
    methods
        %% constructor
        function con = Controller(nGen, nPop, nTrait)
            con.nGen = nGen;
            con.nTrait = nTrait;
            con.nPop = nPop;
            con.pop = Population(nPop, nTrait);
            % set random target with values (-1, 1)
            con.target = rand(nTrait, 1);
                con.target( con.target < 0.5 ) = -1;
                con.target( con.target >= 0.5) =  1;
            con.savedGrn = zeros(nTrait, nTrait, nPop, nGen);
        end
        
        %% functions
        fit = calcFitness(con);   % calculate fitness for recombination
        grnSimilarity = calcGrnSimilarity(con); % simple analysis of grn tendencies over time
        calcHebb(con);            % calculate the Hebb matrix
        depict(con);              % graphical output of simulation
        simulate(con);            % manages simulation process
        sortedGrns = sortByDistance(con); % sort function for 'depict.m'
        
    end
end
