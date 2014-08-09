require "rps_test/version"
require "rps_test/rps.rb"

module RpsTest
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
    def test_play_returns_a_string
      assert_instance_of String, @rps.play('rock')
    end
    def test_play_assigns_player_move
      @rps.play('rock')
      assert_equal 'rock', @rps.instance_variable_get(:@player_move)
    end
    def test_play_returns_correct_string_for_rock_move
      @rps.play('paper')
      assert_equal "Paper against rock! You win!", @rps.instance_variable_get(:@string)      if @rps.instance_variable_get(:@computer_move) === 'rock'
      assert_equal "Paper against scissors! You lose!", @rps.instance_variable_get(:@string) if @rps.instance_variable_get(:@computer_move) === 'scissors'
      assert_equal "Paper against paper! It's a tie!", @rps.instance_variable_get(:@string)  if @rps.instance_variable_get(:@computer_move) === 'paper'
    end
    def test_play_returns_correct_string_for_paper_move
      @rps.play('scissors')
      assert_equal "Paper against paper! It's a tie!", @rps.instance_variable_get(:@string)  if @rps.instance_variable_get(:@computer_move) === 'paper'
      assert_equal "Paper against rock! You win!", @rps.instance_variable_get(:@string)      if @rps.instance_variable_get(:@computer_move) === 'rock'
      assert_equal "Paper against scissors! You lose!", @rps.instance_variable_get(:@string) if @rps.instance_variable_get(:@computer_move) === 'scissors'
    end
    def test_play_returns_correct_string_for_scissors_move
      @rps.play('scissors')
      assert_equal "Scissors against paper! You win!", @rps.instance_variable_get(:@string)       if @rps.instance_variable_get(:@computer_move) === 'paper'
      assert_equal "Scissors against rock! You lose!", @rps.instance_variable_get(:@string)       if @rps.instance_variable_get(:@computer_move) === 'rock'
      assert_equal "Scissors against scissors! It's a tie!", @rps.instance_variable_get(:@string) if @rps.instance_variable_get(:@computer_move) === 'scissors'
    end
    def test_play_returns_correct_string_for_dynamite_move
      @rps = RPS.new(true, false)
      @rps.play('dynamite')
      assert_equal "Dynamite against paper! You win!", @rps.instance_variable_get(:@string)       if @rps.instance_variable_get(:@computer_move) === 'paper'
      assert_equal "Dynamite against rock! You win!", @rps.instance_variable_get(:@string)        if @rps.instance_variable_get(:@computer_move) === 'rock'
      assert_equal "Dynamite against scissors! You lose!", @rps.instance_variable_get(:@string)   if @rps.instance_variable_get(:@computer_move) === 'scissors'
      assert_equal "Dynamite against dynamite! It's a tie!", @rps.instance_variable_get(:@string) if @rps.instance_variable_get(:@computer_move) === 'dynamite'
    end
    def test_play_returns_correct_string_for_lizard_move
      @rps = RPS.new(false, true)
      @rps.play('lizard')
      assert_equal "Lizard against paper! You win!", @rps.instance_variable_get(:@string)       if @rps.instance_variable_get(:@computer_move) === 'paper'
      assert_equal "Lizard against rock! You lose!", @rps.instance_variable_get(:@string)        if @rps.instance_variable_get(:@computer_move) === 'rock'
      assert_equal "Lizard against scissors! You lose!", @rps.instance_variable_get(:@string)   if @rps.instance_variable_get(:@computer_move) === 'scissors'
      assert_equal "Lizard against lizard! It's a tie!", @rps.instance_variable_get(:@string) if @rps.instance_variable_get(:@computer_move) === 'lizard'
      assert_equal "Lizard against spock! You win!", @rps.instance_variable_get(:@string) if @rps.instance_variable_get(:@computer_move) === 'spock'
    end
    def test_play_returns_correct_string_for_spock_move
      @rps = RPS.new(false, true)
      @rps.play('spock')
      assert_equal "Spock against paper! You lose!", @rps.instance_variable_get(:@string)       if @rps.instance_variable_get(:@computer_move) === 'paper'
      assert_equal "Spock against rock! You win!", @rps.instance_variable_get(:@string)        if @rps.instance_variable_get(:@computer_move) === 'rock'
      assert_equal "Spock against scissors! You win!", @rps.instance_variable_get(:@string)   if @rps.instance_variable_get(:@computer_move) === 'scissors'
      assert_equal "Spock against lizard! You lose!", @rps.instance_variable_get(:@string) if @rps.instance_variable_get(:@computer_move) === 'lizard'
      assert_equal "Spock against spock! It's a tie!", @rps.instance_variable_get(:@string) if @rps.instance_variable_get(:@computer_move) === 'spock'
    end
    def test_play_increments_score_upon_win
      rps = RPS.new
      rps.instance_variable_set(:@computer_move, 'scissors')
      rps.play('rock')
      assert_equal 1, rps.score
    end
    def test_play_increments_computer_score_upon_loss
      rps = RPS.new
      rps.instance_variable_set(:@computer_move, 'scissors')
      rps.play('paper')
      assert_equal 1, rps.computer_score
    end
    def test_end_of_round_resets_scores_after_player_wins
      rps = RPS.new
      5.times do
        rps.instance_variable_set(:@computer_move, 'scissors')
        rps.play('rock')
        assert(rps.score >= 0 && rps.score <= 3, msg = "Score is not between 0 and 3")
        assert(rps.computer_score >= 0 && rps.computer_score <= 3, msg = "Computer score is not between 0 and 3")
      end
    end
    def test_end_of_round_resets_scores_after_computer_wins
      rps = RPS.new
      5.times do
        rps.instance_variable_set(:@computer_move, 'scissors')
        rps.play('paper')
        assert(rps.computer_score >= 0 && rps.computer_score <= 3, msg = "Computer score is not between 0 and 3")
        assert(rps.score >= 0 && rps.score <= 3, msg = "Score is not between 0 and 3")
      end
    end
    def test_wins_incremented_after_3_consecutive_rounds_won
      rps = RPS.new
      3.times do
        rps.instance_variable_set(:@computer_move, 'scissors')
        rps.play('rock')
      end
      assert_equal 1, rps.wins
    end
    def test_losses_incremented_after_3_consecutive_rounds_lost
      rps = RPS.new
      3.times do
        rps.instance_variable_set(:@computer_move, 'scissors')
        rps.play('paper')
      end
      assert_equal 1, rps.losses
    end
  end
end
