function fit = calcFitness(con)
%--------------------------------------------------------------------------
% calcFitness:
% [insert description]
% calcFitness: Formel aus Paper (fitness = 1+phenotype*target)
%--------------------------------------------------------------------------
% objective function (from GATutorial)
diff = con.pop.phenotype - con.target;
objeval = sum(diff.*diff,1);

% calcFitness (from GATutorial)
% Calculate standard deviation of fitnesses:
sigma = std(objeval);
if sigma ~= 0
    fitness = 1+(mean(objeval)-objeval) / sigma; % Sigma Scaling??
    fitness(fitness<=0) = 0;
else
    fitness = ones(1,con.nPop);
end

% Normalise fitness values:
fit = fitness/sum(fitness);
end

