require_relative "./models/ingredient.rb"
require_relative "./models/recipe.rb"
require_relative "./models/review.rb"

class FillTable
  
  def fill_initial_tables
    Recipe.delete_all
    Ingredient.delete_all
    #Review.delete_all
    r = Allrecipes.new

    recipe = []
    rec = r.all({keys: ["name", "image", "servings", "prep_time", "cook_time", "ingredients", "directions"]})
    rec.each do |r|
      recipe << r
    end

    recipe.each do |r|
  
      #Fills the recipes table in the database
      unless Recipe.find_by name: r[:name].nil?
        binding.pry
        d = r[:directions] * "  "
        Recipe.create(name: r[:name], image: r[:image], servings: r[:servings], prep_time: r[:prep_time], cook_time: r[:cook_time], directions: d)
        recipe = Recipe.find_by name: r[:name]
        
         #Fills the ingredients table
        r[:ingredients].each do |i|
  
          if Ingredient.find_by name: i[:name].nil?
            ingredient = Ingredient.find_by name: i[:name]
            recipe.ingredients << ingredient
          else
            Ingredient.create(name: i[:name])
            ingredient = Ingredient.find_by name: i[:name]
            recipe.ingredients << ingredient
          end
        end
      end
    end
  end

end