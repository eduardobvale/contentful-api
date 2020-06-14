class RecipesController < ApplicationController
  def index
    @recipes = helpers.contentful.entries(content_type: "recipe")
  end

  def show
    @recipe = helpers.contentful.entries(content_type: "recipe", "sys.id" => params[:id]).first
    render :not_found, status: :not_found if @recipe.nil?
  end
end