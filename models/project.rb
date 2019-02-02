class Project

  Projects = [
    {
      url: "https://www.journalbotapp.com",
      title: "",
      image_url: "/images/journal.png"
    },
    {
      url: "http://govastly.com",
      title: "Vastly",
      image_url: "/images/vastly.png"
    },
    {
      url: "http://hipster.tripp-roberts.com",
      title: "Spotify Playlist Rater",
      image_url: "/images/hipster.png"
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
