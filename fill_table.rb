require_relative "./models/ingredient.rb"
require_relative "./models/recipe.rb"
require_relative "./models/review.rb"

class FillTable
  
  def initialize
    @recipe = []
  end
  
  def fill_initial_tables
    delete_tables
    pull_from_gem
    input_recipes
  end
  
  def delete_tables
    
    Recipe.delete_all
    Ingredient.delete_all
    Review.delete_all
    
  end
  
  def pull_from_gem
    
    r = Allrecipes.new
    rec = r.all({keys: ["name", "image", "servings", "prep_time", "cook_time", "ingredients", "directions"]})
    rec.each do |x|
      @recipe << x  
    end
    
  end
  
  def input_recipes
    
    @recipe.each do |r|
  
      unless Recipe.find_by name: r[:name].nil?
        binding.pry
        d = r[:directions] * "  "
        Recipe.create(name: r[:name], image: r[:image], servings: r[:servings], prep_time: r[:prep_time], cook_time: r[:cook_time], directions: d)
        recipe_get = Recipe.find_by name: r[:name]
        input_ingredients(recipe_get, r[:ingredients])
      end
      
    end
  end
  
  def input_ingredients(recipe_object, ingredients_list)
    
    ingredients_list.each do |i|

      unless Ingredient.find_by name: i[:name].nil?
        Ingredient.create(name: i[:name])
      end
      
      ingredient = Ingredient.find_by name: i[:name]
      recipe_object.ingredients << ingredient
    end
  end

end