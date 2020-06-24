function con = Client
%--------------------------------------------------------------------------
% Client:
% [insert description]
%--------------------------------------------------------------------------
%% parameter settings
nGen = 1000;      % paper: 8*10^5
nPop = 50;       % na in paper
nTrait = 8;     % paper: 8

%% sim start
con = Controller(nGen, nPop, nTrait);
tic

con.target = [1; 1; -1; -1; -1; 1 ; -1; 1];
con.simulate();
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

