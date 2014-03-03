class Deck
	attr_accessor :cards
	
	def initialize
		self.cards = []
		%w(s h c d).each do |suit|
			{"A" => 13, "K" => 12, "Q" => 11, "J" => 10, "10" => 9, "9" => 8,
			 "8" => 7,  "7" => 6,  "6" => 5,  "5" => 4,  "4" => 3,  "3" => 2, "2" => 1}.each do |key, value|
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

	def deal(players)
		shuffled_deck = self.shuffle
		players.times do
			hand = shuffled_deck.pop(5)
			Hand.new(hand)
		end
	end
end