require 'minitest/autorun'

class TestRPS < MiniTest::Unit::TestCase
  def setup
    @rps = RPS.new
  end
  def test_default_score_is_zero
    assert_equal 0, @rpis.score
  end
end

