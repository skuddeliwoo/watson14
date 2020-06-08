function Client
%--------------------------------------------------------------------------
% Client:
% [insert description]
%--------------------------------------------------------------------------
%% parameter settings
nGen = 200;      % paper: 8*10^5
nPop = 8;       % na in paper
nTrait = 8;     % paper: 8

%% sim start
wat = Watson14(nGen, nPop, nTrait);
tic
wat.simulate();
wat.depict();
toc

%% Todo-list:
% - properties von Watson14 auf privat setzen (ganz am Ende der
% implementierung)
% - develop: überprüfung auf Plausibilität & Kommentierung
% - Watson14: Kommentierung
% - calcFitness: Formel aus Paper (fitness = 1+phenotype*target)
% - depict: eventuell 5 least distant

%% Fragen an Pauli:
% - develop: for-loop
% - graphische Ausgabe?
% - code von ihm copy pasten?
end

