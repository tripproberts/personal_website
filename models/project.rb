class Project

  Projects = [
    {
      url: "http://govastly.com",
      title: "Vastly",
      image_url: "/images/vastly.jpg"
    },
    {
      url: "http://hipster-rate.me",
      title: "Spotify Playlist Rater",
      image_url: "/images/hipster.jpg"
    }
  ]

  attr_accessor :url, :title, :image_url

  def initialize(args={})
    @url = args[:url]
    @title = args[:title]
    @image_url = args[:image_url]
  end

  def self.recent(limit=5)
    Projects.map {|project| Project.new(project)}
  end

end
