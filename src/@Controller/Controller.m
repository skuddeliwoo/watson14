classdef Controller < handle
%--------------------------------------------------------------------------
% Controller: provides utility functions for 'Population.m' and methods to
% analyse and picture results
%--------------------------------------------------------------------------
        
%% attributes
properties 
    hebb                    % Hebb matrix
    nPop                    % amount of individuals
    nTrait                  % amount of traits per individual
    nGen                    % amount of generations
    pop                     % handle on 'Population.m'
    savedGrn                % saved grns for each generation
    target                  % target phenotype (selective enviroment)
        
end
    
methods
    %% constructor
    function con = Controller(nGen, nPop, nTrait)
        con.nGen = nGen;
        con.nTrait = nTrait;
        % amount of individuals must be divisible by 2 for correct
        % recombination
        if rem(nPop, 2) == 0
            con.nPop = nPop;
        else
            con.nPop = nPop + 1;
        end
        con.pop = Population(nPop, nTrait);
        % set random target with values (-1, 1)
        con.target = rand(nTrait, 1);
            con.target( con.target < 0.5 ) = -1;
            con.target( con.target >= 0.5) =  1;
        con.savedGrn = zeros(nTrait, nTrait, nPop, nGen);
    end
        
    %% functions
    % calculate fitness for recombination
    fit = calcFitness(con);   
    % simple analysis of grn tendencies over time
    grnSimilarity = calcGrnSimilarity(con); 
    % calculate the Hebb matrix
    calcHebb(con);          
    % graphical output of simulation
    depict(con);              
    % manages simulation process
    simulate(con);            
    % sort function for 'depict.m'
    sortedGrns = sortByDistance(con); 
        
end
end
