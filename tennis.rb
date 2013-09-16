module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end


    # Records a win for a ball in a game.
    #
    # winner - The Integer (1 or 2) representing the winning player.
    #
    # Returns the score of the winning player. 
    def wins_ball(winner)
      # TODO: Think it's gross to pass an integer instead of a player object?
      # Then reimplement this method!
      if player == 1
        @player1.record_won_ball!
      else
        @player2.record_won_ball!
      end

      def wins_game(player)
        if player == 1
          @player1.record_won_ball!
        else
          @player1.record_won_ball!
        end
      end
  end

  class Player
    attr_accessor :points, :opponent, :deuce, :advantage, :win

    def initialize
      @points = 0
    end

    def opponent
      @opponent
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player.
    # Each score has been added depending on the amount of points
    def score
      return 'love' if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty' if @points == 2
      return 'forty' if @points == 3
      return 'deuce' if @points >= 3 && @points = opponent.points
      return 'advantage' if @points >= 3 && @pointes - 1 == opponent.points
    end


    def game_won?
      if @points >= 4 && @points - 2 > opponent.points
        record_won_game
      end
    end


  end
end