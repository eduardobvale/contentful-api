require 'rails_helper'

RSpec.describe "recipes/show.html.erb", type: :view do
  it "displays the recipe" do
    recipe = build(:recipe)
    assign(:recipe, recipe)

    render

    expect(rendered).to match /#{recipe.title}/
  end
end
