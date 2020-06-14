class RetrieveRecipes
  prepend SimpleCommand

  def initialize(recipe_id = nil)
    @recipe_id = recipe_id
    @client = get_client
  end
  
  def get_client
    Contentful::Client.new(
      access_token: ENV['CONTENTFUL_ACCESS_TOKEN'],
      space: ENV['CONTENTFUL_SPACE_ID'],
      dynamic_entries: :auto,
      raise_errors: true
    )
  end

  def map_entry_to_recipe entry
    Recipe.new(
      id: entry.sys[:id],
      title: entry.fields[:title],
      description: entry.fields[:description],
      calories: entry.fields[:calories],
      photo_url: entry.fields[:photo] ? entry.fields[:photo].url : nil,
      chef_name: entry.fields[:chef] ? entry.fields[:chef].name : nil,
      tags: entry.fields[:tags] ? entry.fields[:tags].map(&:name) : []
    ) if entry && entry.fields
  end

  def call
    if @recipe_id
      @client.entries(content_type: "recipe", "sys.id" => @recipe_id).map{|entry| map_entry_to_recipe(entry) }
    else
      @client.entries(content_type: "recipe").map{|entry| map_entry_to_recipe(entry) }
    end
  end
end