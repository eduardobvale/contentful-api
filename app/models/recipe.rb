class Recipe
  include ActiveModel::Model

  attr_accessor :id, :title, :description, :photo_url, :calories, :chef_name, :tags
end