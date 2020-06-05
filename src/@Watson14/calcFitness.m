function fit = calcFitness(wat)
%--------------------------------------------------------------------------
% calcFitness:
% [insert description]
%--------------------------------------------------------------------------
    % objective function (from GATutorial)
    diff = wat.phenotype - wat.target;
    objeval = sum(diff.*diff,1);

    % calcFitness (from GATutorial)
    % Calculate standard deviation of fitnesses:
    sigma = std(objeval);
    if sigma ~= 0
        fitness = 1+(mean(objeval)-objeval) / sigma; % Sigma Scaling??
        fitness(fitness<=0) = 0;
    else
        fitness = ones(1,wat.nPop);
    end

    % Normalise fitness values:
    fit = fitness/sum(fitness);
end

