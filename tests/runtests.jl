cd(@__DIR__)

using Pkg

using Test, TestSetExtensions, SafeTestsets
using SearchLight

@testset ExtendedTestSet "SearchLight PostgreSQL Adapter tests" begin
  @includetests ARGS
end