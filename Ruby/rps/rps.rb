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
  def test_throw_returns_a_string
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
  def test_throw_returns_correct_string
    begin
      @rps.throw('rock')
    rescue
      "Exception!"
    ensure
      assert_equal @rps.instance_variable_get(:@string), "Rock against scissors! You win!" if @rps.instance_variable_get(:@computer_move) === 'scissors'
      assert_equal @rps.instance_variable_get(:@string), "Rock against paper! You lose!"   if @rps.instance_variable_get(:@computer_move) === 'paper'
      assert_equal @rps.instance_variable_get(:@string), "Rock against rock! It's a tie!"  if @rps.instance_variable_get(:@computer_move) === 'rock'
    end
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
    case @player_move
    when 'rock'
      if @computer_move === 'scissors'
        @string = "Rock against scissors! You win!"
      elsif @computer_move === 'paper'
        @string = "Rock against paper! You lose!"
      elsif @computer_move === 'rock'
        @string = "Rock against rock! It's a tie!"
      else
        raise "I'm broken!"
      end
    end
  end
end
