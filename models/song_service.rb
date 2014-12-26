require './models/song'

class SongService

  def self.recent_photos(limit=5)
    parse_songs(songs_from_service(limit))
  end

  private

  def self.songs_from_service(limit)
    client = SoundCloud.new(:client_id => 'e7e960ffba3f725701fba044110bbfcd')
    client.get("/users/12841237/tracks", limit: limit)
  end

  def self.parse_songs(songs)
    songs.map { |song|
      Song.new(
        id: args[:id],
        url: args[:permalink_url],
        title: args[:title],
        stream_url: args[:stream_url],
        created_at: args[:created_at]
      )
    }
  end

end
