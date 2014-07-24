require 'minitest/autorun'

class TestRPS < MiniTest::Test
  def setup
    @rps = RPS.new
  end
  def test_default_score_is_zero
    assert_equal 0, @rps.score
  end
  def test_default_losses_is_zero
    assert_equal 0, @rps.losses
  end
  def test_default_wins_is_zero
    assert_equal 0, @rps.wins
  end
  def test_throw_returns_string
    assert_instance_of String, @rps.throw('rock')
  end
  def test_throw_assigns_player_move
    @rps.throw('rock')
    assert_equal 'rock', @rps.instance_variable_get(:@player_move)
  end
  def test_throw_assigns_computer_move
    @rps.throw('rock')
    assert_instance_of String, @rps.instance_variable_get(:@computer_move)
  end
end

class RPS
  attr_reader :score, :losses, :wins
  def initialize
    @score, @losses, @wins = 0, 0, 0
    @moves = ['rock', 'paper', 'scissors']
  end
  def throw(move)
    @player_move = move
    @computer_move = @moves.sample
    ""
  end
end
