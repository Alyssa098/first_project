get "/recipes" do
  @recipes = Recipe.all
  erb :"recipes/recipes_index"
end

get "/recipes/new" do
  erb :"recipes/recipes_new"
end

post "/recipes/create" do
  @recipe = Recipe.create({name: params[:name], servings: params[:servings], prep_time: params[:prep_time], cook_time: params[:cook_time]})
  erb :"recipes/recipes_create"
end

get "/recipes/:id/edit" do
  @recipe = Recipe.find(params[:id])
  erb :"recipes/recipes_edit"
end

post "/recipes/:id/update" do
  @recipe = User.find(params[:id])
  @recipe.update_attributes({name: params[:name], servings: params[:servings], prep_time: params[:prep_time], cook_time: params[:cook_time]})
  erb :"recipes/recipes_update"
end

get "/recipes/:id/delete" do
  Recipe.find(params[:id]).delete
  erb :"recipes/recipes_delete"
end

get "/recipes/:id" do
  @recipe = Recipe.find(params[:id])
  erb :"recipes/recipes_show"
end