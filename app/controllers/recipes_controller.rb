class RecipesController < ApplicationController
  def index
    @recipes = Rails.cache.fetch("all/recipes", expires_in: 12.hours) do
      helpers.contentful.entries(content_type: "recipe")
    end
  end

  def show
    @recipe = Rails.cache.fetch("#{params[:id]}/recipes", expires_in: 12.hours) do
      helpers.contentful.entries(content_type: "recipe", "sys.id" => params[:id]).first
    end

    render :not_found, status: :not_found if @recipe.nil?
  end
end