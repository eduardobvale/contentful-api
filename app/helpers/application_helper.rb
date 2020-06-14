require 'contentful'

module ApplicationHelper
  def contentful
    @client ||= Contentful::Client.new(
      access_token: ENV['CONTENTFUL_ACCESS_TOKEN'],
      space: ENV['CONTENTFUL_SPACE_ID'],
      dynamic_entries: :auto,
      raise_errors: true
    )
  end

  def kramdown(text)
    return sanitize Kramdown::Document.new(text).to_html
  end
end
