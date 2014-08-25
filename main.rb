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


#r = Allrecipes.new

#recipe = []
#rec = r.all({page: 17, keys: ["name", "image", "servings", "prep_time", "cook_time", "ingredients", "directions"]})
#rec.each do |r|
  #recipe << r
  #end

#recipe.each do |r|
  
  #Fills the recipes table in the database
  #if Recipe.where(name: r[:name]) == []
    #Recipe.create(:name => r[:name], :servings => r[:servings], :prep_time => r[:prep_time], :cook_time => r[:cook_time])
    #end
  #r[:ingredients].each do |i|
      
    #Fills the ingredients table
    #if Ingredient.where(name: i[:name]) == []
      #Ingredient.create(:name => i[:name])
      #end
  #end
  #end

  get "/" do
    erb :home
  end
  