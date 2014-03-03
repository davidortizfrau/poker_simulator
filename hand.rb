load "poker_hands.rb"

class Hand
	include PokerHands
	attr_accessor :cards 

	def initialize(cards)
		# cards is an array of Card objects created when 
		# calling the deal() method on a Deck object
		self.cards = cards.sort_by! { |i| i.value }

  	visual_hand = []
		self.cards.each do |c|
			visual_hand.push("#{c.face}#{c.suit}")
		end
		puts "Hand: #{visual_hand.join(" ")} "
		puts "#{evaluate}" 
	end

	def faces_array
		faces = []
		self.cards.each do |card|
			faces.push("#{card.face}")
		end
		faces
	end

	def suits_array
		suits = []
		self.cards.each do |card|
			suits.push(card.suit)
		end
		suits
	end

	def values_array
		values = []
		self.cards.each do |card|
			values.push(card.value)
		end
		values
	end

private
	
	def evaluate
		pair(self)
		straight(self)
		flush(self)
	end

end