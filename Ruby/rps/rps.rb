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
  def test_throw_returns_correct_string_for_rock_move
    @rps.throw('rock')
    assert_equal "Rock against scissors! You win!", @rps.instance_variable_get(:@string) if @rps.instance_variable_get(:@computer_move) === 'scissors'
    assert_equal "Rock against paper! You lose!", @rps.instance_variable_get(:@string)   if @rps.instance_variable_get(:@computer_move) === 'paper'
    assert_equal "Rock against rock! It's a tie!", @rps.instance_variable_get(:@string)  if @rps.instance_variable_get(:@computer_move) === 'rock'
  end
  def test_throw_returns_correct_string_for_paper_move
    @rps.throw('paper')
    assert_equal "Paper against rock! You win!", @rps.instance_variable_get(:@string)      if @rps.instance_variable_get(:@computer_move) === 'rock'
    assert_equal "Paper against scissors! You lose!", @rps.instance_variable_get(:@string) if @rps.instance_variable_get(:@computer_move) === 'scissors'
    assert_equal "Paper against paper! It's a tie!", @rps.instance_variable_get(:@string)  if @rps.instance_variable_get(:@computer_move) === 'paper'
  end
  def test_throw_returns_correct_string_for_scissors_move
    @rps.throw('scissors')
    assert_equal "Scissors against paper! You win!", @rps.instance_variable_get(:@string)       if @rps.instance_variable_get(:@computer_move) === 'paper'
    assert_equal "Scissors against rock! You lose!", @rps.instance_variable_get(:@string)       if @rps.instance_variable_get(:@computer_move) === 'rock'
    assert_equal "Scissors against scissors! It's a tie!", @rps.instance_variable_get(:@string) if @rps.instance_variable_get(:@computer_move) === 'scissors'
  end
  def test_throw_increments_score_upon_win
    rps = RPS.new
    rps.instance_variable_set(:@computer_move, 'scissors')
    rps.throw('rock')
    assert_equal 1, rps.score
  end
  def test_throw_increments_computer_score_upon_loss
    rps = RPS.new
    rps.instance_variable_set(:@computer_move, 'scissors')
    rps.throw('paper')
    assert_equal 1, rps.computer_score
  end
  def test_end_of_round_resets_scores_after_player_wins
    rps = RPS.new
    5.times do
      rps.instance_variable_set(:@computer_move, 'scissors')
      rps.throw('rock')
      assert(rps.score >= 0 && rps.score <= 3, msg = "Score is not between 0 and 3")
      assert(rps.computer_score >= 0 && rps.computer_score <= 3, msg = "Computer score is not between 0 and 3")
    end
  end
  def test_end_of_round_resets_scores_after_computer_wins
    rps = RPS.new
    5.times do
      rps.instance_variable_set(:@computer_move, 'scissors')
      rps.throw('paper')
      assert(rps.computer_score >= 0 && rps.computer_score <= 3, msg = "Computer score is not between 0 and 3")
      assert(rps.score >= 0 && rps.score <= 3, msg = "Score is not between 0 and 3")
    end
  end
  def test_wins_incremented_after_3_consecutive_rounds_won
    rps = RPS.new
    3.times do
      rps.instance_variable_set(:@computer_move, 'scissors')
      rps.throw('rock')
    end
    assert_equal 1, @wins
  end
end

class RPS
  attr_reader :score, :computer_score, :wins, :losses
  def initialize
    @score, @computer_score, @wins, @losses = 0, 0, 0, 0
    @moves = ['rock', 'paper', 'scissors']
  end
  def throw(move)
    @player_move = move
    @computer_move ||= @moves.sample
    case @player_move
    when 'rock'
      if @computer_move === 'scissors'
        @score += 1
        @string = "Rock against scissors! You win!"
        end_of_round?
      elsif @computer_move === 'paper'
        @computer_score += 1
        @string = "Rock against paper! You lose!"
        end_of_round?
      elsif @computer_move === 'rock'
        @string = "Rock against rock! It's a tie!"
        end_of_round?
      else
        raise "I'm broken!"
      end
    when 'paper'
      if @computer_move === 'rock'
        @score += 1
        @string = "Paper against rock! You win!"
        end_of_round?
      elsif @computer_move === 'scissors'
        @computer_score += 1
        @string = "Paper against scissors! You lose!"
        end_of_round?
      elsif @computer_move === 'paper'
        @string = "Paper against paper! It's a tie!"
        end_of_round?
      else
        raise "I'm broken!"
      end
    when 'scissors'
      if @computer_move === 'paper'
        @score += 1
        @string = "Scissors against paper! You win!"
        end_of_round?
      elsif @computer_move === 'rock'
        @computer_score += 1
        @string = "Scissors against rock! You lose!"
        end_of_round?
      elsif @computer_move === 'scissors'
        @string = "Scissors against scissors! It's a tie!"
        end_of_round?
      else
        raise "I'm broken!"
      end
    end
  end
  def end_of_round?
    @computer_move = nil
    if @score === 3
      @score = 0
      @computer_score = 0
      puts @string
      "You won the round!"
    elsif @computer_score === 3
      @score = 0
      @computer_score = 0
      puts @string
      "You lost this round!"
    else
      puts @string
      "Your score: #{@score}, Computer score: #{@computer_score}"
    end
  end
end
