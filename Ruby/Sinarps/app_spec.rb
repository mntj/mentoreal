ENV['RACK_ENV'] = 'test'

require_relative 'app'
require 'test/unit'
require 'rack/test'

class HowdyTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_says_howdy
    get '/'
    assert last_response.ok?
    assert_equal "Howdy Ho!\n", last_response.body
  end
end
