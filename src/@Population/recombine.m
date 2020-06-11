function pop = recombine(pop, fitness)
%--------------------------------------------------------------------------
% recombine:
% [insert description]
%--------------------------------------------------------------------------

% select
cumFitness = cumsum(fitness);

% Create randomised list of fitness-selected parent indices:

markers = rand(1,pop.nPop);
[~,parents] = histc(markers,[0 cumFitness]);
parents = parents(randperm(pop.nPop));
% parents = find

% 1st half of parents are Mummies; 2nd half are Daddies:
maternalGenotype = pop.genotype(:,parents(1:pop.nPop/2));
paternalGenotype = pop.genotype(:,parents(pop.nPop/2+1:pop.nPop));

% Create crossover masks ...
xover = false(pop.nTrait,pop.nPop/2);
xPt = ceil(rand(1,pop.nPop/2)*(pop.nTrait-1));
for i=1:pop.nPop/2
	xover(1:xPt(i),i) = true;
end
% ... then stochastically enforce crossover probability:
myPX = 0.4;
xover(:,rand(1,pop.nPop/2)>myPX) = false;

% Perform crossover:
girls = maternalGenotype;
girls(xover) = paternalGenotype(xover);
boys = paternalGenotype;
boys(xover) = maternalGenotype(xover);

pop.genotype(:,:) = [girls boys];

end

