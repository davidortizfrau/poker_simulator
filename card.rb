class Card
	attr_accessor :suit, :value, :face

	@SUITS = ["s", "h", "c", "d"]

	@FACE_VALUES = {"A" => 13, "K" => 12, "Q" => 11, "J" => 10, "10" => 9, "9" => 8,
	     "8" => 7,  "7" => 6,  "6" => 5,  "5" => 4,  "4" => 3,  "3" => 2, "2" => 1}

	class << self
  	attr_reader :SUITS, :FACE_VALUES
  end
end