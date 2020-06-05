function Client
%--------------------------------------------------------------------------
% Client:
% [insert description]
%--------------------------------------------------------------------------
%% parameter settings
nGen = 2;
nPop = 5;
nTraits = 3;

%% sim start
wat = Watson14(nGen, nPop, nTraits);
wat.simulate();
wat.depict();

%% Todo-list:
% - properties von Watson14 auf privat setzen (ganz am Ende der
% implementierung)
% - develop: �berpr�fung auf Plausibilit�t
% - calcHebb: Multiplikationsfaktor noch implementieren (siehe Paper Figure
% 1 C)
end

