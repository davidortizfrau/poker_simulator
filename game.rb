load 'deck.rb'
load 'card.rb'
load 'hand.rb'

class Game
	attr_accessor :players, :deck

	def initialize
		self.deck = Deck.new
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
		shuffled_deck = self.deck.shuffle
		(1..self.players).each do |i|
			hand = shuffled_deck.pop(5)
			Hand.new(hand, i)
		end

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