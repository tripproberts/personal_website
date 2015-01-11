require 'instagram'
require './models/photo'
require "open-uri"

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

  def self.download(limit=5)
    configure_service
    photos_from_service(limit).each_with_index do |photo, i|
      open("./public/images/photo_#{i}.jpg", 'wb') do |file|
          file << open(photo[:images][:standard_resolution][:url]).read
      end
    end
  end

  private

  def self.photos_from_service(limit)
    Instagram.client.user_recent_media("231999328", {count: limit})
  end

  def self.parse_photos(photos)
    photos.map { |photo|
      Photo.new(
        text: photo[:caption][:text],
        image_url: photo[:images][:standard_resolution][:url],
        link: photo[:link]
      )
    }
  end

end
