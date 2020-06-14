class RecipesController < ApplicationController
  def index
    command = RetrieveRecipes.call
    if command.success?
      @recipes = Rails.cache.fetch("all/recipes", expires_in: 1.week) { command.result }
    else
      render :unavailable
    end
  end

  def show
    command = RetrieveRecipes.call params[:id]
    if command.success?
      @recipe = Rails.cache.fetch("#{params[:id]}/recipes", expires_in: 1.week) { command.result.first }
      render :not_found, status: :not_found if @recipe.nil?
    else
      render :unavailable
    end
  end
end