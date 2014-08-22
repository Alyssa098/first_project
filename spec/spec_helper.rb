
ENV['RACK_ENV'] = 'test'

require "sinatra/activerecord"

require "sqlite3"

require_relative "../models/ingredient.rb"
require_relative "../models/recipe.rb"
require_relative "../models/post.rb"

RSpec.configure do |config|
  Ingredient.delete_all
  Recipe.delete_all
  Review.delete_all
end
