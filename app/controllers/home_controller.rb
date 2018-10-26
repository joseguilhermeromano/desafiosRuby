class HomeController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def recipe_details
    @recipe = Recipe.find(params[:id])
  end
end
