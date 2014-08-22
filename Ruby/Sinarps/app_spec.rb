ENV['RACK_ENV'] = 'test'

require 'test/unit'
require 'rack/test'
require_relative 'app'

class HowdyTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_has_no_errors
    get '/'
    assert last_response.ok?
    assert last_response.errors.empty?
  end

  def test_rps_has_no_errors
    get '/rps'
    assert last_response.status === 200
    assert last_response.errors.empty?
  end

  def test_rps_assigns_correct_move_for_rock
    get '/rps', :move => 'rock'
    assert last_response.errors.empty?
    assert_equal 'rock', last_request.env['rack.request.query_hash']['move']
  end

  def test_rps_assigns_correct_move_for_paper
    get '/rps', :move => 'paper'
    assert last_response.errors.empty?
    assert_equal 'paper', last_request.env['rack.request.query_hash']['move']
  end

  def test_rps_assigns_correct_move_for_scissors
    get '/rps', :move => 'scissors'
    assert last_response.errors.empty?
    assert_equal 'scissors', last_request.env['rack.request.query_hash']['move']
  end

  def test_dynamite_assigns_correct_move_for_rock
    get '/dynamite', :move => 'rock'
    assert last_response.errors.empty?
    assert_equal 'rock', last_request.env['rack.request.query_hash']['move']
  end

  def test_dynamite_assigns_correct_move_for_paper
    get '/dynamite', :move => 'paper'
    assert last_response.errors.empty?
    assert_equal 'paper', last_request.env['rack.request.query_hash']['move']
  end

  def test_dynamite_assigns_correct_move_for_scissors
    get '/dynamite', :move => 'scissors'
    assert last_response.errors.empty?
    assert_equal 'scissors', last_request.env['rack.request.query_hash']['move']
  end

  def test_dynamite_assigns_correct_move_for_dynamite
    get '/dynamite', :move => 'dynamite'
    assert last_response.errors.empty?
    assert_equal 'dynamite', last_request.env['rack.request.query_hash']['move']
  end

  def test_lizard_spock_assigns_correct_move_for_rock
    get '/lizard-spock', :move => 'rock'
    assert last_response.errors.empty?
    assert_equal 'rock', last_request.env['rack.request.query_hash']['move']
  end

  def test_lizard_spock_assigns_correct_move_for_paper
    get '/lizard-spock', :move => 'paper'
    assert last_response.errors.empty?
    assert_equal 'paper', last_request.env['rack.request.query_hash']['move']
  end

  def test_lizard_spock_assigns_correct_move_for_scissors
    get '/lizard-spock', :move => 'scissors'
    assert last_response.errors.empty?
    assert_equal 'scissors', last_request.env['rack.request.query_hash']['move']
  end

  def test_lizard_spock_assigns_correct_move_for_lizard
    get '/lizard-spock', :move => 'lizard'
    assert last_response.errors.empty?
    assert_equal 'lizard', last_request.env['rack.request.query_hash']['move']
  end

  def test_lizard_spock_assigns_correct_move_for_spock
    get '/lizard-spock', :move => 'spock'
    assert last_response.errors.empty?
    assert_equal 'spock', last_request.env['rack.request.query_hash']['move']
  end
end
