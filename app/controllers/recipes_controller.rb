class RecipesController < ApplicationController
  def index
    begin
      @recipes = Rails.cache.fetch("all/recipes", expires_in: 1.week) do 
        command = RetrieveRecipes.call
        raise command.errors if not command.success?
        command.result
      end
    rescue => exception
      render :unavailable
    end
  end

  def show
    begin
      @recipe = Rails.cache.fetch("#{params[:id]}/recipes", expires_in: 1.week) do 
        command = RetrieveRecipes.call params[:id]
        raise command.errors if not command.success?
        command.result.first
      end
      render :not_found, status: :not_found if @recipe.nil?
    rescue => exception
      render :unavailable
    end
  end
end