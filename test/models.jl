module TestModels

  using SearchLight

  ######## Model from Genie-Searchligth-example-app extracted ############
  export Book, BookWithInterns
  using SearchLight, Dates

  ######## Model from Genie-Searchligth-example-app extracted ############
  export Callback
  export seed, fields_to_store

  mutable struct Book <: AbstractModel

    ### FIELDS
    id::DbId
    title::String
    author::String
    cover::String

    ### VALIDATION
    # validator::ModelValidator

    ### CALLBACKS
    # before_save::Function
    # after_save::Function
    # on_save::Function
    # on_find::Function
    # after_find::Function

    ### SCOPES
    # scopes::Dict{Symbol,Vector{SearchLight.SQLWhereEntity}}

    ### constructor
    Book(;
      ### FIELDS
      id = DbId(),
      title = "",
      author = "",
      cover = "",

      ### VALIDATION
      # validator = ModelValidator([
      #   ValidationRule(:title, BooksValidator.not_empty)
      # ]),

      ### CALLBACKS
      # before_save = (m::Todo) -> begin
      #   @info "Before save"
      # end,
      # after_save = (m::Todo) -> begin
      #   @info "After save"
      # end,
      # on_save = (m::Todo, field::Symbol, value::Any) -> begin
      #   @info "On save"
      # end,
      # on_find = (m::Todo, field::Symbol, value::Any) -> begin
      #   @info "On find"
      # end,
      # after_find = (m::Todo) -> begin
      #   @info "After find"
      # end,

      ### SCOPES
      # scopes = Dict{Symbol,Vector{SearchLight.SQLWhereEntity}}()

    ) = new(id, title, author, cover                                                             ### FIELDS
            # validator,                                                                  ### VALIDATION
            # before_save, after_save, on_save, on_find, after_find                       ### CALLBACKS
            # scopes                                                                      ### SCOPES
            )
  end

  mutable struct BookWithInterns <: AbstractModel
    ### INTERNALS
    _table_name::String
    _id::String
    _serializable::Vector{Symbol}

    ### FIELDS
    id::DbId
    title::String
    author::String
    cover::String

    ### VALIDATION
    # validator::ModelValidator

    ### CALLBACKS
    # before_save::Function
    # after_save::Function
    # on_save::Function
    # on_find::Function
    # after_find::Function

    ### SCOPES
    # scopes::Dict{Symbol,Vector{SearchLight.SQLWhereEntity}}

    ### constructor
    BookWithInterns(;
      ### FIELDS
      id = DbId(),
      title = "",
      author = "",
      cover = "",

      ### VALIDATION
      # validator = ModelValidator([
      #   ValidationRule(:title, BooksValidator.not_empty)
      # ]),

      ### CALLBACKS
      # before_save = (m::Todo) -> begin
      #   @info "Before save"
      # end,
      # after_save = (m::Todo) -> begin
      #   @info "After save"
      # end,
      # on_save = (m::Todo, field::Symbol, value::Any) -> begin
      #   @info "On save"
      # end,
      # on_find = (m::Todo, field::Symbol, value::Any) -> begin
      #   @info "On find"
      # end,
      # after_find = (m::Todo) -> begin
      #   @info "After find"
      # end,

      ### SCOPES
      # scopes = Dict{Symbol,Vector{SearchLight.SQLWhereEntity}}()

    ) = new("bookwithinterns", "id", Symbol[],                                                ### INTERNALS
            id, title, author, cover                                                             ### FIELDS
            # validator,                                                                  ### VALIDATION
            # before_save, after_save, on_save, on_find, after_find                       ### CALLBACKS
            # scopes                                                                      ### SCOPES
            )
  end

  Base.@kwdef mutable struct Callback <: AbstractModel
    id::DbId = DbId()
    title::String = ""
    indicator::Bool = true
    created_at::String = string(Dates.now())
    # callbacks
    before_save::Function = (m::Callback) -> begin
      @info "Do something before saving"
    end
    after_save::Function = (m::Callback) -> begin
      @info "Do something after saving"
    end
  end

  function seed()
    BillGatesBooks = [
      ("The Best We Could Do", "Thi Bui"),
      ("Evicted: Poverty and Profit in the American City", "Matthew Desmond"),
      ("Believe Me: A Memoir of Love, Death, and Jazz Chickens", "Eddie Izzard"),
      ("The Sympathizer!", "Viet Thanh Nguyen"),
      ("Energy and Civilization, A History", "Vaclav Smil")
    ]
  end

end ### End Module
