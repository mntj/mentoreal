class RPS
  attr_reader :score, :computer_score, :wins, :losses
  def initialize
    @score, @computer_score, @wins, @losses = 0, 0, 0, 0
    @moves = ['rock', 'paper', 'scissors']
  end
  def play(move)
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
