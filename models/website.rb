class Website

  URLS = ["http://govastly.com", "http://hipster-rate.me"]

  attr_accessor :url

  def initialize(args={})
    @url = args[:url]
  end

  def self.recent(limit=5)
    URLS.take(limit)
  end

end
