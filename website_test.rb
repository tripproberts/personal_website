require 'test/unit'
require './website'

class WebsiteTest < Test::Unit::TestCase
  def test_recent
    assert_equal Website.recent(2), ["http://govastly.com", "http://hipster-rate.me"]
  end
end
