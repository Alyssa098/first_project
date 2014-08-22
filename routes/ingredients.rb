get "/ingredients" do
  @ingredients = Ingredient.all
  erb :"ingredients/ingredients_index"
end

get "/ingredients/new" do
  erb :"ingredients/ingredients_new"
end

post "/ingredients/create" do
  @ingredient = Ingredient.create({name: params[:name]})
  erb :"ingredients/ingredients_create"
end

get "/ingredients/:id/edit" do
  @ingredient = Ingredient.find(params[:id])
  erb :"ingredients/ingredients_edit"
end

post "/ingredients/:id/update" do
  @ingredient = Ingredient.find(params[:id])
  @ingredient.update_attributes({name: params[:name]})
  erb :"ingredients/ingredients_update"
end

get "/ingredients/:id/delete" do
  Ingredient.find(params[:id]).delete
  erb :"ingredients/ingredients_delete"
end

get "/ingredients/:ingredients_id/recipes" do
  @ingredient = Ingredient.find(params[:ingredients_id])
  erb :"ingredients/ingredients_recipes"
end

get "/ingredients/:id" do
  @ingredient = Ingredient.find(params[:id])
  erb :"ingredients/ingredients_show"
end