function Client
%--------------------------------------------------------------------------
% Client:
% [insert description]
%--------------------------------------------------------------------------
%% parameter settings
nGen = 20000;
nPop = 8;
nTraits = 5;

%% sim start
wat = Watson14(nGen, nPop, nTraits);
wat.simulate();
wat.depict();

%% Todo-list:
% - properties 1von Watson14 auf privat setzen (ganz am Ende der
% implementierung)
% - develop: �berpr�fung auf Plausibilit�t & Kommentierung
% - calcHebb: Multiplikationsfaktor noch implementieren (siehe Paper Figure
% 1 C) und Kommentierung
% - mutate: Vielleicht bessere L�sung f�r +-1 cap, und eventuell variables
% cap?
end

