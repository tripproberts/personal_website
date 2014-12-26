require 'instagram'
require './models/photo'

class PhotoService

  def self.recent_photos(limit=5)
    configure_service
    parse_photos(photos_from_service(limit))
  end


  def self.configure_service
    Instagram.configure do |config|
      config.client_id = ENV["INSTAGRAM_ID"]
    end
  end

  private

  def self.photos_from_service(limit)
    Instagram.client.user_recent_media("231999328", {count: limit})
  end

  def self.parse_photos(photos)
    photos.map { |photo|
      Photo.new(
        text: args[:caption][:text],
        image_url: args[:images][:standard_resolution][:url],
        link: args[:link]
      )
    }
  end

end
