class RPS
  attr_reader :score, :computer_score, :wins, :losses
  def initialize
    @score, @computer_score, @wins, @losses = 0, 0, 0, 0
    @moves = ['rock', 'paper', 'scissors']
    @dynamite_moves = @moves << 'dynamite'
  end
  def play(move, dynamite=false)
    @player_move = move
    if dynamite
      @computer_move ||= @dynamite_moves.sample
    else
      @computer_move ||= @moves.sample
    end
    case @player_move
    when 'rock'
      if @computer_move === 'scissors'
        @score += 1
        @string = "Rock against scissors! You win!"
        end_of_round_checker
      elsif @computer_move === 'paper'
        @computer_score += 1
        @string = "Rock against paper! You lose!"
        end_of_round_checker
      elsif @computer_move === 'rock'
        @string = "Rock against rock! It's a tie!"
        end_of_round_checker
      else
        raise "I'm broken!"
      end
    when 'paper'
      if @computer_move === 'rock'
        @score += 1
        @string = "Paper against rock! You win!"
        end_of_round_checker
      elsif @computer_move === 'scissors'
        @computer_score += 1
        @string = "Paper against scissors! You lose!"
        end_of_round_checker
      elsif @computer_move === 'paper'
        @string = "Paper against paper! It's a tie!"
        end_of_round_checker
      else
        raise "I'm broken!"
      end
    when 'scissors'
      if @computer_move === 'paper'
        @score += 1
        @string = "Scissors against paper! You win!"
        end_of_round_checker
      elsif @computer_move === 'rock'
        @computer_score += 1
        @string = "Scissors against rock! You lose!"
        end_of_round_checker
      elsif @computer_move === 'scissors'
        @string = "Scissors against scissors! It's a tie!"
        end_of_round_checker
      else
        raise "I'm broken!"
      end
    when 'dynamite'
      if dynamite
        if @computer_move === 'paper'
          @score += 1
          @string = "Dynamite against paper! You win!"
          end_of_round_checker
        elsif @computer_move === 'rock'
          @score += 1
          @string = "Dynamite against rock! You win!"
          end_of_round_checker
        elsif @computer_move === 'scissors'
          @computer_score += 1
          @string = "Dynamite against scissors! You lose!"
          end_of_round_checker
        elsif @computer_move === 'dynamite'
          @string = "Dynamite against dynamite! It's a tie!"
          end_of_round_checker
        end
      else
        raise "This isn't a dynamite game! Try play([your_move], true)"
    end
  end
  def end_of_round_checker
    @computer_move = nil
    if @score === 3
      @score = 0
      @computer_score = 0
      @wins += 1
      puts @string
      "You won the round!"
    elsif @computer_score === 3
      @score = 0
      @computer_score = 0
      @losses += 1
      puts @string
      "You lost this round!"
    else
      puts @string
      "Your score: #{@score}, Computer score: #{@computer_score}"
    end
  end
end
