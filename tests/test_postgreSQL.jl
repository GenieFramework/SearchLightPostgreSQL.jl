using Test, TestSetExtensions, SafeTestsets

module TestSetupTeardown

  using SearchLight
  using SearchLightPostgreSQL

  export prepareDbConnection, tearDown

  connection_file = "postgres_connection.yml"

  function prepareDbConnection()
      
      conn_info_postgres = SearchLight.Configuration.load(connection_file)
      conn = SearchLight.connect(conn_info_postgres)

      return conn
  end

  function tearDown(conn)
    if conn !== nothing
        ######## Dropping used tables

        SearchLight.disconnect(conn)
        rm(SearchLight.config.db_migrations_folder,force=true, recursive=true)
    end
  end

end


@safetestset "Core features PostgreSQL" begin
    using SearchLight
    using SearchLightPostgreSQL
    using Test, TestSetExtensions
    using Main.TestSetupTeardown

    conn_info_postgres = SearchLight.Configuration.load(TestSetupTeardown.connection_file)

    @test conn_info_postgres["adapter"] == "PostgreSQL"
    @test conn_info_postgres["host"] == "127.0.0.1"
    @test conn_info_postgres["password"] == "postgres"
    @test conn_info_postgres["config"]["log_level"] == ":debug"
    @test conn_info_postgres["port"] == 5432
    @test conn_info_postgres["username"] == "postgres"
    @test conn_info_postgres["config"]["log_queries"] == true
    @test conn_info_postgres["database"] == "searchlight_tests"

end;

@safetestset "PostgresSQL connection" begin
    using SearchLight
    using SearchLightPostgreSQL
    using LibPQ
    using Main.TestSetupTeardown


    conn = prepareDbConnection()
    
    infoDB = LibPQ.conninfo(conn)

    keysInfo = Dict{String, String}()

    push!(keysInfo, "host"=>"127.0.0.1")
    push!(keysInfo, "port"=>"5432")
    push!(keysInfo, "dbname" => "searchlight_tests")
    push!(keysInfo, "user"=> "postgres")

    for info in keysInfo
      infokey = info[1]
      infoVal = info[2]
      indexInfo = Base.findfirst(x->x.keyword == infokey, infoDB)
      valInfo = infoDB[indexInfo].val
      @test infoVal == valInfo
    end

    tearDown(conn)

end;

@safetestset "Saving and Reading with callbacks" begin
    using SearchLight
    using SearchLightPostgreSQL
    using Main.TestSetupTeardown
    using Dates

    include("test_models.jl")
    using Main.TestModels

    prepareDbConnection()

    testItem = Callback(title = "testing")
    SearchLight.Generator.new_table_migration("Callback")
    SearchLight.Migration.up()

    testItem|>save!

end;




  