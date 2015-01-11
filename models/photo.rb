require './models/photo_service'
require 'timeout'

class Photo

  attr_accessor :text, :image_url, :link

  def initialize(args={})
    @text = args[:text]
    @image_url = args[:image_url]
    @link = args[:link]
  end

  def self.recent(limit=5)
    begin
      get_photos_from_photo_service(limit)
    rescue Timeout::Error
      get_cached_photos(limit)
    end
  end

  private

  def self.get_photos_from_photo_service(limit)
    Timeout::timeout(3) do
      PhotoService.recent_photos(limit)
    end
  end

  def self.get_cached_photos(limit)
    limit.times.map { |i|
      Photo.new(image_url: "images/photo_#{i}.jpg")
    }
  end

end
