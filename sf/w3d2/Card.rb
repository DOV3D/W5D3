# require "byebug"
class Card

    attr_reader :face_value, :face_up

    def initialize(face_value, face_up = false)
        @face_value = face_value
        @face_up = face_up
    end

    def hide
        @face_up = false 
    end

    def reveal
        @face_up = true
    end
    
    def to_s
        @face_value.to_s
    end

    def self.new_cards(size)
        cards = []
        letters = ("a".."z").to_a

        # debugger
        while cards.length < (size * size) / 2
            cards << self.new(letters.sample, false)
        end
        
        new_cards = []
        cards.each do |card|
            new_card = self.new(card.face_value, card.face_up)
            new_cards << new_card
        end 
        new_cards.concat(cards) 
        new_cards.shuffle! 

        #def populate
        #num_pairs = (self.size **2) / 2
        #@card_values = (A..Z).to_a
        #@card_values.shuffle
        #cards = []
        #num_pairs.times do
        #pair_value = card_values.pop
        #card_1 = Card.new(pair_value)
        #card_2 = Card.new(pair_value)
        #cards << card1 << card2
        #end
        #cards.shuffle!


    end 


end