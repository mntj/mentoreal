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
end

class RPS
  attr_reader :score, :losses, :wins
  def initialize
    @score, @losses, @wins = 0, 0, 0
  end
  def throw(move)
    ""
  end
end
