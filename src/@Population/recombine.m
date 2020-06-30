function pop = recombine(pop, fitness)
%--------------------------------------------------------------------------
% recombine: genetic algorithm to represent sexuell recombination.
% genotype and gen regulation network is recombined with a single
% crossover. 
% recombination depends on fitness of individuals: higher
% fitness values awards a higher probability of getting selected.
% parents are selected through Stochastic Universal Sampling
% code is founded on code by Niall Palfreyman (Package 01GAPackage,
% Class @BP302GATutorial)
%--------------------------------------------------------------------------

% select
cumFitness = cumsum(fitness);

% Create randomised list of fitness-selected parent indices:

markers = rand(1,pop.nPop);
[~,~,parents] = histcounts(markers, [0 cumFitness]);
parents = parents(randperm(pop.nPop));

% 1st half of parents are Mummies; 2nd half are Daddies:
maternal.genotype = pop.genotype(:,parents(1:pop.nPop/2));
maternal.grn = pop.grn(:,:,parents(1:pop.nPop/2));
paternal.genotype = pop.genotype(:,parents(pop.nPop/2+1:pop.nPop));
paternal.grn = pop.grn(:,:,parents(1:pop.nPop/2));

% Create crossover masks ...
xover.genotype = false(pop.nTrait,pop.nPop/2);
xPt = ceil(rand(1,pop.nPop/2)*(pop.nTrait-1));
for i=1:pop.nPop/2
	xover.genotype(1:xPt(i),i) = true;
end
% ... then stochastically enforce crossover probability:
myPX = 0.4;

xover.genotype(:,rand(1,pop.nPop/2)>myPX) = false;

xover.grn = reshape(xover.genotype, pop.nTrait, 1, pop.nPop/2);
xover.grn = repmat(xover.grn, 1, pop.nTrait);

% Perform crossover:
girls.genotype = maternal.genotype;
girls.grn = maternal.grn;
girls.genotype(xover.genotype) = paternal.genotype(xover.genotype);
girls.grn(xover.grn) = paternal.grn(xover.grn);

boys.genotype = paternal.genotype;
boys.grn = paternal.grn;
boys.genotype(xover.genotype) = maternal.genotype(xover.genotype);
boys.grn(xover.grn) = maternal.grn(xover.grn);

pop.genotype(:,:) = [girls.genotype boys.genotype];
pop.grn(:,:,:) = cat(3, girls.grn, boys.grn);

end

