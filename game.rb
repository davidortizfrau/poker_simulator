load 'deck.rb'
load 'card.rb'
load 'hand.rb'

class Game
	attr_accessor :players

	def initialize
		@deck = Deck.new
		how_many_players
	end

	def how_many_players
		puts "How many Players?"

		input = gets.chomp
		puts ""
		self.players = input.to_i

		if input.to_i >= 2 && input.to_i <= 10
			self.deal
		else
			puts "please type 2-10 players"
			how_many_players
		end
	end

	def deal
		@deck.shuffle
		@deck.deal(self.players)

		puts "Play Again? (y/n)"

		input = gets.chomp
		if input == 'y'
			play_again
		else
			exit
		end
	end

	def play_again
		Game.new
	end


end