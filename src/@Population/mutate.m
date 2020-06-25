function pop = mutate(pop, fMutMagCapGene, fMutMagCapGRN)
%--------------------------------------------------------------------------
% mutate: mutation on genotype and gene regulation network is applied every
% evolutionary timestep: one entry of the genotype (and the grn) gets
% mutated by adding a value in the range +-fMutMagCapGene (or fMutMagCapGRN
% for the grn)
%--------------------------------------------------------------------------
%% mutation of genotype:
% create column vector for indexing the mutation
mutGeneIndices = ceil(rand(pop.nPop, 1) * pop.nTrait) + ...
                 (0:(pop.nPop - 1))' * pop.nTrait;
% reshape genotype into column vector
genotype = pop.genotype(:);
% apply mutation of genotype with indexing vector
genotype(mutGeneIndices) = genotype(mutGeneIndices) + ...
                           2*fMutMagCapGene*(rand(pop.nPop,1) - 0.5);
% assign mutated genotype matrix
pop.genotype = reshape(genotype, [pop.nTrait, pop.nPop]);
% cap magnitude at +- 1
pop.genotype(pop.genotype > 1) = 1;
pop.genotype(pop.genotype < -1) = -1;

%% mutation of grn (genotype regulation network)
% similar to mutation of genotype above

% create column vector for indexing the mutation
mutGrnIndices = ceil(rand(pop.nPop, 1) * pop.nTrait^2) + ...
    (0:(pop.nPop-1))' * pop.nTrait^2;

% reshape grn into column vector
grn = pop.grn(:);

% apply mutation of grn with indexing vector
grn(mutGrnIndices) = grn(mutGrnIndices) + ...
    2*fMutMagCapGRN*(rand(pop.nPop,1) - 0.5);

% assign mutated grn matrix
pop.grn = reshape(grn, [pop.nTrait, pop.nTrait, pop.nPop]);

% cap magnitude at +- 1
pop.grn(pop.grn > 1) = 1;
pop.grn(pop.grn < -1) = -1;

end
