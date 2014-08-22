get "/recipes/:recipe_id/reviews" do
  @recipe = Recipe.find(params[:recipe_id])
  @reviews = @recipe.reviews
  erb :"reviews/reviews_index"
end

get "/recipes/:recipe_id/reviews/new" do
  @recipe = Recipe.find(params[:recipe_id])
  erb :"reviews/reviews_new"
end

post "/recipes/:recipe_id/reviews/create" do
  @recipe = Recipe.find(params[:recipe_id])
  @review = Review.create({recipe_id: params[:recipe_id], text: params[:text]})
  erb :"reviews/reviews_create"
end

get "/reviews/:id/edit" do
   @review = Review.find(params[:id])
  erb :"reviews/reviews_edit"
end

post "/reviews/:id/update" do
  @review = Review.find(params[:id])
  @review.update_attributes({text: params[:text]})
  erb :"reviews/reviews_update"
end

get "/reviews/:id/delete" do
  Review.find(params[:id]).delete
  erb :"reviews/reviews_delete"
end

get "/reviews/:id" do
  @review = Review.find(params[:id])
  erb :"reviews/reviews_show"
end