require './models/song_service'
require 'soundcloud'
require 'json'

class Song

  attr_accessor :id, :url, :title, :created_at

  def initialize(args={})
    @id = args[:id]
    @url = args[:url]
    @title = args[:title]
    @created_at = args[:created_at]
  end

  def self.recent(limit=5)
    SongService.recent_songs(limit)
  end

end
