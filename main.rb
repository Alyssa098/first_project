require "pry"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "sqlite3"

set :server, 'webrick'

require_relative "./models/ingredient.rb"
require_relative "./models/recipe.rb"
require_relative "./models/review.rb"

require "allrecipes"

#r = Allrecipes.new

#recipe = []
#rec = r.all({page: 17, keys: ["name", "servings", "prep_time", "cook_time", "ingredients"]})
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
  
  get "/recipes" do
    @recipes = Recipe.all
    erb :recipes_index
  end
  
  get "/recipes/new" do
    erb :recipes_new
  end
  
  post "/recipes/create" do
    @recipe = Recipe.create({name: params[:name], servings: params[:servings], prep_time: params[:prep_time], cook_time: params[:cook_time]})
    erb :recipes_create
  end
  
  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :recipes_edit
  end
  
  post "/recipes/:id/update" do
    @recipe = User.find(params[:id])
    @recipe.update_attributes({name: params[:name], servings: params[:servings], prep_time: params[:prep_time], cook_time: params[:cook_time]})
    erb :recipes_update
  end
  
  get "/recipes/:id/delete" do
    Recipe.find(params[:id]).delete
    erb :recipes_delete
  end
  
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :recipes_show
  end
  
  #------------------------------------------------------------------------------------------
  
  get "/ingredients" do
    @ingredients = Ingredient.all
    erb :ingredients_index
  end
  
  get "/ingredients/new" do
    erb :ingredients_new
  end
  
  post "/ingredients/create" do
    @ingredient = Ingredient.create({name: params[:name]})
    erb :ingredients_create
  end
  
  get "/ingredients/:id/edit" do
    @ingredient = Ingredient.find(params[:id])
    erb :ingredients_edit
  end
  
  post "/ingredients/:id/update" do
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update_attributes({name: params[:name]})
    erb :ingredients_update
  end
  
  get "/ingredients/:id/delete" do
    Ingredient.find(params[:id]).delete
    erb :ingredients_delete
  end
  
  get "/ingredients/:ingredients_id/recipes" do
    @ingredient = Ingredient.find(params[:ingredients_id])
    erb :ingredients_recipes
  end
  
  get "/ingredients/:id" do
    @ingredient = Ingredient.find(params[:id])
    erb :ingredients_show
  end
  
  #--------------------------------------------------------------------------
  
  get "/recipes/:recipe_id/reviews" do
    @recipe = Recipe.find(params[:recipe_id])
    @reviews = @recipe.reviews
    erb :reviews_index
  end
  
  get "/recipes/:recipe_id/reviews/new" do
    @recipe = Recipe.find(params[:recipe_id])
    erb :reviews_new
  end
  
  post "/recipes/:recipe_id/reviews/create" do
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.create({recipe_id: params[:recipe_id], text: params[:text]})
    erb :reviews_create
  end
  
  get "/reviews/:id/edit" do
     @review = Review.find(params[:id])
    erb :reviews_edit
  end
  
  post "/reviews/:id/update" do
    @review = Review.find(params[:id])
    @review.update_attributes({text: params[:text]})
    erb :reviews_update
  end
  
  get "/reviews/:id/delete" do
    Review.find(params[:id]).delete
    erb :reviews_delete
  end
  
  get "/reviews/:id" do
    @review = Review.find(params[:id])
    erb :reviews_show
  end