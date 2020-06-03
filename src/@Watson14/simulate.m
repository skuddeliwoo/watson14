function simulate(wat)
%--------------------------------------------------------------------------
% simulate:
% [insert description]
%--------------------------------------------------------------------------
%% hidden parameters:
% for develop:
nDevSteps = 10;
fMagFactor = 1;    % from paper
fDecayRate = 0.2;  % from paper
% for

%% simulation process managment
for generation = 1 : wat.nGen
    wat.develop(nDevSteps, fMagFactor, fDecayRate);
    wat.recombine;
    wat.mutate;
end

end