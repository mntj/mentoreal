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
  def test_throw_returns_correct_string_for_rock_move
    begin
      @rps.throw('rock')
    rescue
      "Exception!"
    ensure
      assert_equal "Rock against scissors! You win!", @rps.instance_variable_get(:@string) if @rps.instance_variable_get(:@computer_move) === 'scissors'
      assert_equal "Rock against paper! You lose!", @rps.instance_variable_get(:@string)   if @rps.instance_variable_get(:@computer_move) === 'paper'
      assert_equal "Rock against rock! It's a tie!", @rps.instance_variable_get(:@string)  if @rps.instance_variable_get(:@computer_move) === 'rock'
    end
  end
  def test_throw_returns_correct_string_for_paper_move
    begin
      @rps.throw('paper')
    rescue
      "Exception!"
    ensure
      assert_equal "Paper against rock! You win!", @rps.instance_variable_get(:@string)      if @rps.instance_variable_get(:@computer_move) === 'rock'
      assert_equal "Paper against scissors! You lose!", @rps.instance_variable_get(:@string) if @rps.instance_variable_get(:@computer_move) === 'scissors'
      assert_equal "Paper against paper! It's a tie!", @rps.instance_variable_get(:@string)  if @rps.instance_variable_get(:@computer_move) === 'paper'
    end
  end
  def test_throw_returns_correct_string_for_scissors_move
    begin
      @rps.throw('scissors')
    rescue
      "Exception!"
    ensure
      assert_equal "Scissors against paper! You win!", @rps.instance_variable_get(:@string)       if @rps.instance_variable_get(:@computer_move) === 'paper'
      assert_equal "Scissors against rock! You lose!", @rps.instance_variable_get(:@string)       if @rps.instance_variable_get(:@computer_move) === 'rock'
      assert_equal "Scissors against scissors! It's a tie!", @rps.instance_variable_get(:@string) if @rps.instance_variable_get(:@computer_move) === 'scissors'
    end
  end
  def test_throw_increments_score_upon_win
    begin
      rps = RPS.new
      rps.instance_variable_set(:@computer_move, 'scissors')
      rps.throw('rock')
    rescue
      "Exception!"
    ensure
      assert_equal 1, rps.score
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
    when 'paper'
      if @computer_move === 'rock'
        @string = "Paper against rock! You win!"
      elsif @computer_move === 'scissors'
        @string = "Paper against scissors! You lose!"
      elsif @computer_move === 'paper'
        @string = "Paper against paper! It's a tie!"
      else
        raise "I'm broken!"
      end
    when 'scissors'
      if @computer_move === 'paper'
        @string = "Scissors against paper! You win!"
      elsif @computer_move === 'rock'
        @string = "Scissors against rock! You lose!"
      elsif @computer_move === 'scissors'
        @string = "Scissors against scissors! It's a tie!"
      else
        raise "I'm broken!"
      end
    end
  end
end
