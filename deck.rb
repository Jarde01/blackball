class Deck
    SUITS = ['H', 'D', 'C', 'S']
    STRINGVALUES = [ "2", "3", "4", "5", "6", "7", "8", "9", "10", 'J', 'Q', 'K', 'A']

    def initialize(numDecks)
        @cards = []
        @numDecks = numDecks

        i = 0
        while i < numDecks        #Loops to create the cards in the deck
            SUITS.each do |suit|
                value = 2   #must set the value to 1 after each suit has been added
                STRINGVALUES.each do |stringvalue|
                    #print suit+value+" "
                    @cards.push(Card.new(suit, stringvalue, value))   #adding a new card to the deck
                    value = value + 1
                end
            end
            i = i+1
        end
    end

    def toString()
        if @cards.empty? == false
            @cards.each do |card|
                print card.toString()+" "
            end
        else 
            puts "No cards in the deck."
        end
    end

    def pop()
        return @cards.pop
    end

    def at(i)
        return @cards.at(i)
    end

    def shuffle()
        @cards = @cards.shuffle
    end

    def isEmpty()
        return @cards.empty?
    end
end

class Card
    def initialize(suit, stringValue, value)
        @suit = suit
        @stringValue = stringValue
        @value = value
    end

    def toString()
        return @stringValue+@suit
    end

    attr_accessor :suit, :value, :stringValue
end
