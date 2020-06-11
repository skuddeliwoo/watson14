function pop = recombine(pop, fitness)
%--------------------------------------------------------------------------
% recombine:
% [insert description]
%--------------------------------------------------------------------------

% select
cumFitness = cumsum(fitness);

% Create randomised list of fitness-selected parent indices:

markers = rand(1,pop.nPop);
[~,~,parents] = histcounts(markers, [0 cumFitness]);
parents = parents(randperm(pop.nPop));
% parents = find

% 1st half of parents are Mummies; 2nd half are Daddies:
maternal.genotype = pop.genotype(:,parents(1:pop.nPop/2));
maternal.grn = pop.grn(:,:,parents(1:pop.nPop/2));
paternal.genotype = pop.genotype(:,parents(pop.nPop/2+1:pop.nPop));
paternal.grn = pop.grn(:,:,parents(1:pop.nPop/2));

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
girls.genotype = maternal.genotype;
girls.grn = maternal.grn;
girls.genotype(xover) = paternal.genotype(xover);
girls.grn(xover) = paternal.grn(xover);

boys.genotype = paternal.genotype;
boys.grn = paternal.grn;
boys.genotype(xover) = maternal.genotype(xover);
boys.grn(xover) = maternal.grn(xover);

pop.genotype(:,:) = [girls.genotype boys.genotype];
pop.grn(:,:,:) = cat(3, girls.grn, boys.grn);

end

