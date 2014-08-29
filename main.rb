require "rubygems"
require "bundler"

Bundler.require

set :server, 'webrick'

require_relative "./models/ingredient.rb"
require_relative "./models/recipe.rb"
require_relative "./models/review.rb"
require_relative "./routes/ingredients.rb"
require_relative "./routes/recipes.rb"
require_relative "./routes/reviews.rb"
require_relative "./fill_table.rb"

  get "/" do
    binding.pry
    f = FillTable.new
    f.fill_initial_tables
    erb :home
  end
  