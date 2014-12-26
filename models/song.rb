require './models/song_service'
require 'soundcloud'
require 'json'

class Song

  attr_accessor :id, :url, :title, :stream_url, :created_at

  def initialize(args={})
    @id = args[:id]
    @url = args[:url]
    @title = args[:title]
    @stream_url = args[:stream_url]
    @created_at = args[:created_at]
  end

  def self.recent(limit=5)
    SongService.recent_photos(limit).each do |song|
      puts song.url
      puts song.id
      puts song.title
      puts song.stream_url
      puts song.created_at
    end
  end

end
