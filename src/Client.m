function Client
%--------------------------------------------------------------------------
% Client: Client for user to set simulation parameters and starts the
% simulation 
%--------------------------------------------------------------------------
%% parameter settings
nGen = 500;      % paper: 2*10^5
nPop = 50;       % paper only uses one representiv indidiual
nTrait = 8;      % paper: 8

%% sim start
con = Controller(nGen, nPop, nTrait);
tic
% overwrite target to make simulation comparable to 'Watson et al (2014)'
con.target = [1; 1; -1; -1; -1; 1 ; -1; 1];
% start of simulation
con.simulate();
% show results
con.depict();
toc

%% Todo-list:
% - !!!!!!! develop: limit to 1 / -1
% - depict: phenotype
% - properties von Watson14 auf privat setzen (ganz am Ende der
% implementierung)
% - calcFitness: Formel aus Paper (fitness = 1+phenotype*target)
% - nPop % 2 == 0?
%% Fragen an Pauli:
% - develop: for-loop
% - code von ihm copy pasten?
end

