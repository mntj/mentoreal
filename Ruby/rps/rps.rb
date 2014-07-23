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
end

class RPS
  def initialize
    @score, @losses, @wins = 0, 0, 0
  end
  def score
    @score
  end
  def losses
    @losses
  end
  def wins
    @wins
  end
end
