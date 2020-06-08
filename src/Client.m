function Client
%--------------------------------------------------------------------------
% Client:
% [insert description]
%--------------------------------------------------------------------------
%% parameter settings
nGen = 20;      % paper: 8*10^5
nPop = 8;       % na in paper
nTrait = 8;     % paper: 8

%% sim start
wat = Watson14(nGen, nPop, nTrait);
wat.simulate();
wat.depict();

%% Todo-list:
% - properties von Watson14 auf privat setzen (ganz am Ende der
% implementierung)
% - develop: überprüfung auf Plausibilität & Kommentierung
% - calcHebb: Multiplikationsfaktor noch implementieren (siehe Paper Figure
% 1 C) und Kommentierung
% - mutate: Vielleicht bessere Lösung für +-1 cap, und eventuell variables
% cap?
% - Watson14: Kommentierung
% - calcFitness: Formel aus Paper (fitness = 1+phenotype*target)

%% Fragen an Pauli:
% - develop: for-loop
% - graphische Ausgabe?
% - code von ihm copy pasten?
end

