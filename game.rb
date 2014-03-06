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
		players = gets.chomp
		puts ""
		self.players = players.to_i
		players_allowed
	end

	def players_allowed
		minimum_players = 2
		maximum_players = 10
		if self.players >= minimum_players && self.players <= maximum_players
			deal
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
		play_again
	end

	def play_again
		puts "Play Again? (y/n)"
		input = gets.chomp
		input == 'y' ? Game.new : exit
	end
end