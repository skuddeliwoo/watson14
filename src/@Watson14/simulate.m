function simulate(wat)
%--------------------------------------------------------------------------
% simulate:
% [insert description]
%--------------------------------------------------------------------------
%% hidden parameters:
%for develop:
nDevSteps = 8;
fMagFactor = 1;
fDecayRate = 0.2;

%% simulation process managment
for generation = 1 : wat.nGen
    wat.develop(nDevSteps, fMagFactor, fDecayRate);
    wat.recombine;
    wat.mutate;
end

end