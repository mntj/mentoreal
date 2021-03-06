class RPS
  attr_reader :score, :computer_score, :wins, :losses
  def initialize(dynamite=false, lizard_spock=false)
    @dynamite, @lizard_spock = dynamite, lizard_spock
    @score, @computer_score, @wins, @losses = 0, 0, 0, 0
    @moves = ['rock', 'paper', 'scissors']
    @dynamite_moves = @moves + ['dynamite']
    @lizard_spock_moves = @moves + ['lizard', 'spock']
    @lizard_spock_dynamite = @lizard_spock_moves + ['dynamite']
  end
  def play(move)
    @player_move = move
    if @dynamite && @lizard_spock
      @computer_move ||= @lizard_spock_dynamite.sample
    elsif @dynamite
      @computer_move ||= @dynamite_moves.sample
    elsif @lizard_spock
      @computer_move ||= @lizard_spock_moves.sample
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
      elsif @computer_move === 'dynamite'
        @computer_score += 1
        @string = "Rock against dynamite! You lose!"
        end_of_round_checker
      elsif @computer_move === 'spock'
        @computer_score += 1
        @string = "Rock against spock! You lose!"
        end_of_round_checker
      elsif @computer_move === 'lizard'
        @score += 1
        @string = "Rock against lizard! You win!"
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
      elsif @computer_move === 'dynamite'
        @computer_score += 1
        @string = "Paper against dynamite! You lose!"
        end_of_round_checker
      elsif @computer_move === 'spock'
        @score += 1
        @string = "Paper against spock! You win!"
        end_of_round_checker
      elsif @computer_move === 'lizard'
        @computer_score += 1
        @string = "Paper against lizard! You lose!"
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
      elsif @computer_move === 'dynamite'
        @score += 1
        @string = "Scissors against dynamite! You win!"
        end_of_round_checker
      elsif @computer_move === 'spock'
        @computer_score += 1
        @string = "Scissors against spock! You lose!"
        end_of_round_checker
      elsif @computer_move === 'lizard'
        @score += 1
        @string = "Scissors against lizard! You win!"
        end_of_round_checker
      else
        raise "I'm broken!"
      end
    when 'dynamite'
      if @dynamite
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
        elsif @computer_move === 'spock'
          @string = "Dynamite against..spock?? What is this?"
          end_of_round_checker
        elsif @computer_move === 'lizard'
          @string = "Dynamite against..lizard?? What is this?"
          end_of_round_checker
        else
          raise "I'm broken!"
        end
      else
        raise "This isn't a dynamite game! Try RPS.new(true, false) to begin a dynamite game."
      end
    when 'lizard'
      if @lizard_spock
        if @computer_move === 'paper'
          @score += 1
          @string = "Lizard against paper! You win!"
          end_of_round_checker
        elsif @computer_move === 'rock'
          @computer_score += 1
          @string = "Lizard against rock! You lose!"
          end_of_round_checker
        elsif @computer_move === 'scissors'
          @computer_score += 1
          @string = "Lizard against scissors! You lose!"
          end_of_round_checker
        elsif @computer_move === 'spock'
          @score += 1
          @string = "Lizard against spock! You win!"
          end_of_round_checker
        elsif @computer_move === 'lizard'
          @string = "Lizard against lizard! It's a tie!"
          end_of_round_checker
        elsif @computer_move === 'dynamite'
          @string = "Lizard against..dynamite?? What is this?"
          end_of_round_checker
        else
          raise "I'm broken!"
        end
      else
        raise "This isn't a lizard-spock game! Try RPS.new(false, true) to begin a lizard-spock game."
      end
    when 'spock'
      if @lizard_spock
        if @computer_move === 'paper'
          @computer_score += 1
          @string = "Spock against paper! You lose!"
          end_of_round_checker
        elsif @computer_move === 'rock'
          @score += 1
          @string = "Spock against rock! You win!"
          end_of_round_checker
        elsif @computer_move === 'scissors'
          @score += 1
          @string = "Spock against scissors! You win!"
          end_of_round_checker
        elsif @computer_move === 'lizard'
          @computer_score += 1
          @string = "Spock against lizard! You lose!"
          end_of_round_checker
        elsif @computer_move === 'spock'
          @string = "Spock against spock! It's a tie!"
          end_of_round_checker
        elsif @computer_move === 'dynamite'
          @string = "Spock against dynamite! Nobody wins."
          end_of_round_checker
        else
          raise "I'm broken!"
        end
      else
        raise "This isn't a lizard-spock game! Try RPS.new(false, true) to begin a lizard-spock game."
      end
    else
      puts "Case statement broke!"
    end
  end
  def end_of_round_checker
    @computer_move = nil
    if @score === 3
      @score = 0
      @computer_score = 0
      @wins += 1
      puts @string
      return "You won the round!"
    elsif @computer_score === 3
      @score = 0
      @computer_score = 0
      @losses += 1
      puts @string
      return "You lost this round!"
    else
      puts @string
      return "Your score: #{@score}, Computer score: #{@computer_score}"
    end
  end
end
