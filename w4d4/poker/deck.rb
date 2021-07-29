require_relative "card.rb"

class Deck 
    attr_accessor :cards

    def initialize 
        Card.new(:symbol, :type)
        @cards = generate_cards  

    end 

    def shuffle
        @cards.shuffle!
    end 
    
     
    def generate_cards

        nums = (2..10).to_a 
        letters = [:J, :Q, :K, :A]
        suits = ["♥", "♠", "♦", "♣"]

        # cards = []
        # symbols = nums + letters
        # symbols.each do |symbol| 
        #     suits.each do |suit|
        #         card = Card.new(symbol, suit)
        #         cards << card
        #     end 
        # end
        # cards

        cards = (nums + letters).product(suits)

        cards.map {|symbol, type| Card.new(symbol, type)}  
    end 

end 