class Card
    attr_reader :symbol, :type

    def initialize(symbol, type)
        @symbol = symbol
        @type = type 
        
    end 

    def to_s
         "#{@symbol}: #{@type}"
    end 

end 

