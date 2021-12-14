using Pkg

using Test, TestSetExtensions, SafeTestsets
using SearchLight
using SearchLightPostgreSQL

# @testset ExtendedTestSet "SearchLight PostgreSQL adapter tests" begin
#   @includetests ARGS
# end

# run a simple connect test for the first time

@testset ExtendedTestSet "SearchLight tests" begin
    @includetests ARGS
end
