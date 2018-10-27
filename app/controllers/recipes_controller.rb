class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params.require(:recipe).permit(:title, :cuisine, :recipe_type, 
                                                        :difficulty, :cook_time, :ingredients,
                                                        :cook_method))
    @recipe.save
    redirect_to recipe_path(@recipe)
  end
end
