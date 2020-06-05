function mutate(wat)
%--------------------------------------------------------------------------
% mutate:
% 
% jedes individuum: zufälligen trait in G mutieren & same for B
%--------------------------------------------------------------------------
mutMagCap = 0.1;
mutGenIndices = ceil(rand(wat.nPop, 1) * wat.nTrait) + ...
((1:(wat.nPop))' - 1 ) * wat.nTrait;
foo = wat.genotype(:);
foo(mutGenIndices) = foo(mutGenIndices) + (2*mutMagCap*(rand(3,1) - 0.5));
wat.genotype = reshape(foo, [wat.nTrait, wat.nPop]);
% cap / truncate values over +-1 or +-ResultScaling
end
