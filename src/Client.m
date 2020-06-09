function Client
%--------------------------------------------------------------------------
% Client:
% [insert description]
%--------------------------------------------------------------------------
%% parameter settings
nGen = 2000;      % paper: 8*10^5
nPop = 20;       % na in paper
nTrait = 8;     % paper: 8

%% sim start
wat = Watson14(nGen, nPop, nTrait);
tic
wat.simulate();
wat.depict();
toc

%% Todo-list:
% - modularität!!!
% - watson14 ergebnisse reproduzieren
% - properties von Watson14 auf privat setzen (ganz am Ende der
% implementierung)
% - develop: überprüfung auf Plausibilität & Kommentierung
% - Watson14: Kommentierung
% - calcFitness: Formel aus Paper (fitness = 1+phenotype*target)
% - depict: eventuell 5 least distant

%% Fragen an Pauli:
% - develop: for-loop
% - code von ihm copy pasten?
end

