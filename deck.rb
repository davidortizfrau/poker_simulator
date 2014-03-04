class Deck
	attr_accessor :cards
	
	def initialize
		self.cards = []
		Card.SUITS.each do |suit|
			Card.FACE_VALUES.each do |key, value|
				card = Card.new
			  card.face = key
				card.suit = suit
				card.value = value
				self.cards.push(card)
			end
		end
	end

	def shuffle
		self.cards.shuffle!
	end
end