class RecipesController < ApplicationController
  def index
    command = RetrieveRecipes.call
    if command.success?
      @recipes = command.result
    end
  end

  def show
    command = RetrieveRecipes.call params[:id]
    if command.success?
      @recipe = Rails.cache.fetch("#{params[:id]}/recipes", expires_in: 12.hours) { command.result.first }
      render :not_found, status: :not_found if @recipe.nil?
    end
  end
end