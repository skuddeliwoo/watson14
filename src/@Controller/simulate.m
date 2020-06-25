function simulate(con)
%--------------------------------------------------------------------------
% simulate: regulates and simulates progress in time. contains parameters
% for 'develop.m' and 'mutate.m'
%--------------------------------------------------------------------------
%% hidden parameters:
% for develop:
nDevSteps = 10;    % paper: 10
fMagFactor = 1;    % paper: 1
fDecayRate = 0.2;  % paper: 0.2

% for mutate:
fMutMagCapGene = 0.1;                       % paper: 0.1
fMutMagCapGRN = 1/15 * fMutMagCapGene;      % paper: 0.15*fMutMagCapGene

%% simulation process managment
for generation = 1 : con.nGen
    % simple progress display (for longer simulations)
    if (mod(generation, con.nGen/1000) == 0)
        disp(append('progress: ',num2str(generation*100/con.nGen),'%'));
    end
    % save gene regulation networks in every generation
    con.savedGrn(:, :, :, generation) = con.pop.grn;
    % invoke functions in correct order
    con.pop = con.pop.develop(nDevSteps, fMagFactor, fDecayRate);
    con.pop = con.pop.recombine(con.calcFitness());
    con.pop = con.pop.mutate(fMutMagCapGene, fMutMagCapGRN);
end
end