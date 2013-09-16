require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../tennis'

describe Tennis::Game do

  let(:game) { Tennis::Game.new }

  describe '.initialize' do
    it 'creates two players' do
      expect(game.player1).to be_a(Tennis::Player)
      expect(game.player2).to be_a(Tennis::Player)
    end
  end

    it 'sets the opponent for each player' do
      player1 = game.player1
      player2 = game.player2
      
      expect(player1.opponent).to eq(player2)
      expect(player2.opponent).to eq(player1)
    end
  end

  describe '#wins_ball' do
    it 'increments the points of the winning player' do
      player1 = game.player1
      game.wins_ball(player1)

      expect(game.player1.points).to eq(1)
    end
  end

  describe '@wins_game' do
    it "increases the game won count by 1 for the winning player" do
      game.wins_game(1)

      expect(player1.games_won).to eq(1)
    end
  end
end

describe Tennis::Player do
  let(:player) do
    player = Tennis::Player.new
    player.opponent = Tennis::Player.new

    return player
  end
end

  describe '.initialize' do
    it 'sets the points to 0' do
      expect(player.points).to eq(0)
    end 
  end

  describe '#record_won_ball!' do
    it 'increments the points' do
      player.record_won_ball!

      expect(player.points).to eq(1)
    end
  end

  describe '#record_won_game!' do
    it "increases the game won" do
      player.record_won_game!

      expect(player.games_won).to eq(1)
    end
  end

  describe '#score' do
    context 'when points is 0' do
      it 'returns love' do
        player.points = 0

        expect(player.score).to eq('love')
      end
    end
    
    context 'when points is 1' do
      it 'returns fifteen' do
        player.points = 1

        expect(player.score).to eq('fifteen')
      end 
    end
    
    context 'when points is 2' do
      it 'returns thirty' do
        player.points = 2

        expect(player.score).to eq('thirty')
    end
  end
    
    context 'when points is 3' do
      it 'returns forty' do
        player.points = 3

        expect(player.score).to eq('forty')
    end
  end

    context "when both players have greater than or equal to 3 points and score is tied" do
      it 'returns deuce' do
        player.points = 3
        player.opponent.points = 3

        expect(player.score).to eq('deuce')
      end
    end

    context 'when both players have greater than or equal to 3 points and one player has one more point' do
      it 'returns advantage' do
        player.points = 4
        player.opponent.points = 3

        expect(player.score).to eq('advantage')
      end
    end
  end

  describe '#won_game?' do
    context 'if they one player has advantage and scores' do
      it 'will win the game' do
        player.points = 4
        player.opponent.points = 2

        expect(player.games_won).to eq(1)
      end
    end
end  
