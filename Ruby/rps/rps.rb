require 'minitest/autorun'
require 'pry'

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
end

class RPS
  def initialize
    @score = 0
    @losses = 0
  end
  def score
    @score
  end
  def losses
    @losses
  end
end
