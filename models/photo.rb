require './models/photo_service'

class Photo

  attr_accessor :text, :image_url, :link

  def initialize(args={})
    @text = args[:text]
    @image_url = args[:image_url]
    @link = args[:link]
  end

  def self.recent(limit=5)
    PhotoService.recent_photos(limit)
  end

end
