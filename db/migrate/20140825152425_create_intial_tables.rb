class CreateIntialTables < ActiveRecord::Migration
  def change
    
    create_table :ingredients do |t|
      t.string :name
    end
    
    create_table :ingredients_recipes do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
    end
    
    create_table :recipes do |t|
      t.string :name
      t.text :image
      t.integer :servings
      t.integer :prep_time
      t.integer :cook_time
      t.text :directions
    end
    
    create_table :reviews do |t|
      t.integer :recipe_id
      t.text :text
    end
    
  end
end
