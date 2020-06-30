function fit = calcFitness(con)
%--------------------------------------------------------------------------
% calcFitness: calculaltion of fitness depending on distance of phenotype
% to the target (represents a selective enviroment)
% code is founded on code by Niall Palfreyman (Package 01GAPackage,
% Class @BP302GATutorial)
%--------------------------------------------------------------------------
% objective function (from GATutorial)
diff = con.pop.phenotype - con.target;
objeval = sum(diff.*diff,1);

% calcFitness (from GATutorial)
% Calculate standard deviation of fitnesses:
sigma = std(objeval);
if sigma ~= 0
    fitness = 1+(mean(objeval)-objeval) / sigma;
    fitness(fitness<=0) = 0;
else
    fitness = ones(1,con.nPop);
end

% Normalise fitness values:
fit = fitness/sum(fitness);
end

