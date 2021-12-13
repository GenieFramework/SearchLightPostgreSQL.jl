using Pkg

using Test, TestSetExtensions, SafeTestsets
using SearchLight

@testset ExtendedTestSet "SearchLight PostgreSQL adapter tests" begin
  @includetests ARGS
end