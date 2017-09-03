#require_relative './blackball.rb'
require_relative './deck.rb'


class Blackball
    @field
    @roundNum
    @trumpList
    @numCardsDealt
    @numPlayers

    def initialize(numPlayers)
        @numPlayers = numPlayers
        @roundNum = []
        @trumpList = []
        @numCardsDealt = 1

        maxHandSize = findMaxHandSize(numPlayers)

        #push the first number (last round)
        i = 1
        @roundNum.push(i)

        while i != 0 do
            i = i+1
            
            @roundNum.push(i)
            if i == maxHandSize
                while i > 0 do
                    @roundNum.push(i)
                    i = i-1
                end
            end
        end

        #print out the results of the round number array
        @roundNum.each do |num|
            puts num+", "
        end
            
    
    end

    def findMaxHandSize(numPlayers)
        maxHandSize = 1
        while maxHandSize * numPlayers < 52 && maxHandSize < 10 do
            maxHandSize = maxHandSize + 1
        end
        maxHandSize = maxHandSize-1
        print "\nMax hand size: #{maxHandSize}"
    end
    
end

class Player
    @hand
    @tricks
    @score = []
end




#Main program below
puts "\nHello, this is Blackball! How many players?"
numPlayer = gets
numPlayers = numPlayers.to_i

puts "\nPlaying with #{numPlayers} players. "

game = Blackball.new(numPlayers)