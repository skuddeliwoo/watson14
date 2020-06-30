function Client
%--------------------------------------------------------------------------
% Client: Client for user to set simulation parameters and starts the
% simulation 
%--------------------------------------------------------------------------
%% parameter settings
nGen = 500;      % Watson2014: 2*10^5
nPop = 50;       % Watson2014 only uses one representiv indidiual
nTrait = 8;      % Watson2014: 8

%% sim start
con = Controller(nGen, nPop, nTrait);
tic
% overwrite target to be the same as in 'Watson et al (2014)' experiment 1
con.target = [1; 1; -1; -1; -1; 1 ; -1; 1];
% start of simulation
con.simulate();
% show results
con.depict();
toc

end

