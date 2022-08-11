push!(LOAD_PATH, "../src")
using SearchLight
using SearchLightPostgreSQL
using Test


ENV["SEARCHLIGHT_HOST"] = "127.0.0.1"
ENV["SEARCHLIGHT_PORT"] = "5432"
ENV["SEARCHLIGHT_DATABASE"] = "postgres"
ENV["SEARCHLIGHT_USERNAME"] = "postgres"
ENV["SEARCHLIGHT_PASSWORD"] = "postgres"

conn = SearchLight.connect(Dict())

@test isopen(conn)