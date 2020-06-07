function mutate(wat, fMutMagCapGene, fMutMagCapGRN)
%--------------------------------------------------------------------------
% mutate: mutation on genotype and gene regulation network is applied every
% evolutionary timestep: one entry of the genotype (and the grn) gets
% mutated by adding a value in the range +-fMutMagCapGene (or fMutMagCapGRN
% for the grn)
%--------------------------------------------------------------------------
%% mutation of genotype:
% create column vector for indexing the mutation
mutGeneIndices = ceil(rand(wat.nPop, 1) * wat.nTrait) + ...
                (0:(wat.nPop - 1))' * wat.nTrait;
% reshape genotype into column vector
genotype = wat.genotype(:);
% apply mutation of genotype with indexing vector
genotype(mutGeneIndices) = genotype(mutGeneIndices) + ...
                          2*fMutMagCapGene*(rand(wat.nPop,1) - 0.5);
% assign mutated genotype matrix
wat.genotype = reshape(genotype, [wat.nTrait, wat.nPop]);
% cap magnitude at +- 1
wat.genotype(wat.genotype > 1) = 1;
wat.genotype(wat.genotype < -1) = -1;

%% mutation of grn (genotype regulation network)
% similar to mutation of genotype above

% create column vector for indexing the mutation
mutGrnIndices = ceil(rand(wat.nPop, 1) * wat.nTrait^2) + ...
                (0:(wat.nPop-1))' * wat.nTrait^2;
% reshape grn into column vector
grn = wat.grn(:);
% apply mutation of grn with indexing vector
grn(mutGrnIndices) = grn(mutGrnIndices) + ...
                      2*fMutMagCapGRN*(rand(wat.nPop,1) - 0.5);
% assign mutated grn matrix
wat.grn = reshape(grn, [wat.nTrait, wat.nTrait, wat.nPop]);
% cap magnitude at +- 1
wat.grn(wat.grn > 1) = 1;
wat.grn(wat.grn < -1) = -1;

end
