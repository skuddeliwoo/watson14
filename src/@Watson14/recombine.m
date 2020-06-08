function recombine(wat)
%--------------------------------------------------------------------------
% recombine:
% [insert description]
%--------------------------------------------------------------------------
fit = wat.calcFitness();

% select
cumFitness = cumsum(fit);

% Create randomised list of fitness-selected parent indices:

markers = rand(1,wat.nPop);
[~,parents] = histc(markers,[0 cumFitness]);
parents = parents(randperm(wat.nPop));
% parents = find

% 1st half of parents are Mummies; 2nd half are Daddies:
maternalGenotype = wat.genotype(:,parents(1:wat.nPop/2));
paternalGenotype = wat.genotype(:,parents(wat.nPop/2+1:wat.nPop));

% Create crossover masks ...
xover = false(wat.nTrait,wat.nPop/2);
xPt = ceil(rand(1,wat.nPop/2)*(wat.nTrait-1));
for i=1:wat.nPop/2
	xover(1:xPt(i),i) = true;
end
% ... then stochastically enforce crossover probability:
myPX = 0.4;
xover(:,rand(1,wat.nPop/2)>myPX) = false;

% Perform crossover:
girls = maternalGenotype;
girls(xover) = paternalGenotype(xover);
boys = paternalGenotype;
boys(xover) = maternalGenotype(xover);

wat.genotype(:,:) = [girls boys];

end

