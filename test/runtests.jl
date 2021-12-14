using Pkg

using Test, TestSetExtensions, SafeTestsets
using SearchLight
using SearchLightPostgreSQL

# @testset ExtendedTestSet "SearchLight PostgreSQL adapter tests" begin
#   @includetests ARGS
# end

# run a simple connect test for the first time

connection_file = joinpath(@__DIR__,"postgres_connection.yml")
conn_info_postgres = SearchLight.Configuration.load(connection_file)
conn = SearchLight.connect(conn_info_postgres)

SearchLight.disconnect(conn)
