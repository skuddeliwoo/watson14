function simulate(wat)
%--------------------------------------------------------------------------
% simulate:
% [insert description]
%--------------------------------------------------------------------------
%% hidden parameters:
% for develop:
nDevSteps = 10;
fMagFactor = 1;    % from paper
fDecayRate = 0.2;  % from paper

% for recombine:

% for mutate:
fMutMagCapGene = 0.1;                       % from paper
fMutMagCapGRN = 1/15 * fMutMagCapGene;      % from paper (for N = 8)

%% simulation process managment
for generation = 1 : wat.nGen
    wat.develop(nDevSteps, fMagFactor, fDecayRate);
    wat.recombine;
    wat.mutate(fMutMagCapGene, fMutMagCapGRN);
end

end