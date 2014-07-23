require 'minitest/autorun'

class TestRPS < MiniTest::Unit::TestCase
  def setup
    @rps = RPS.new
  end
  def test_default_score_is_zero
    assert_equal 0, @rps.score
  end
end

class RPS
  def score
    0
  end
end
