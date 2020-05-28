function simulate(wat)
%--------------------------------------------------------------------------
% simulate:
% [insert description]
%--------------------------------------------------------------------------

for generation = 1 : wat.nGen
    b.develop;
    b.recombine;
    b.mutate;
end

end