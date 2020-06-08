function Client
%--------------------------------------------------------------------------
% Client:
% [insert description]
%--------------------------------------------------------------------------
%% parameter settings
nGen = 2000;      % paper: 8*10^5
nPop = 8;       % na in paper
nTraits = 8;    % paper: 8

%% sim start
tic
wat = Watson14(nGen, nPop, nTraits);
wat.simulate();
wat.depict();
toc

%% Todo-list:
% - properties von Watson14 auf privat setzen (ganz am Ende der
% implementierung)
% - develop: überprüfung auf Plausibilität & Kommentierung
% - mutate: Vielleicht bessere Lösung für +-1 cap, und eventuell variables
% cap?
% - Watson14: Kommentierung
% - calcFitness: Formel aus Paper (fitness = 1+phenotype*target)

%% Fragen an Pauli:
% - develop: for-loop
% - graphische Ausgabe?
% - code von ihm copy pasten?
end

