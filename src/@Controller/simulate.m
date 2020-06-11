function simulate(con)
%--------------------------------------------------------------------------
% simulate:
% [insert description]
%--------------------------------------------------------------------------
%% hidden parameters:
% for develop:
nDevSteps = 10;    % paper: 10
fMagFactor = 1;    % paper: 1
fDecayRate = 0.2;  % paper: 0.2

% for recombine:


% for mutate:
fMutMagCapGene = 0.1;                       % paper: 0.1
fMutMagCapGRN = 1/15 * fMutMagCapGene;      % paper: 0.15*fMutMagCapGene

%% simulation process managment
for generation = 1 : con.nGen
    con.pop = con.pop.develop(nDevSteps, fMagFactor, fDecayRate);
    con.pop = con.pop.recombine(con.calcFitness());
    con.pop = con.pop.mutate(fMutMagCapGene, fMutMagCapGRN);
end

end