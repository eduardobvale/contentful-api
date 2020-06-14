require 'rails_helper'

RSpec.describe "recipes/index.html.erb", type: :view do
  it "displays all recipes" do
    recipe = build(:recipe)
    assign(:recipes, [recipe])

    render

    expect(rendered).to match /#{recipe.id}/
  end
end
