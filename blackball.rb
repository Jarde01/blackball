#require_relative './blackball.rb'
require_relative './deck.rb'


class Blackball
    @field
    @roundNum
    @trumpList
    @numCardsDealt
    @numPlayers

    def initialize(numPlayers)
        if numPlayers != 0
            @numPlayers = numPlayers
            @roundNum = []
            @trumpList = []
            @numCardsDealt = 1

            trumpValues = ['H', 'D', 'C', 'S', 'NT']

            maxHandSize = findMaxHandSize(numPlayers)

            #push the first number (last round)
            i = 1
            @roundNum.push(i)

            while i >= 0 do
                i = i+1
                print "first while i: #{i}"
                @roundNum.push(i)
                if i >= maxHandSize
                    while i > 0 do
                        @roundNum.push(i)
                        i = i-1
                        print "second while i: #{i}"
                        
                    end
                end
            end

            #print out the results of the round number array
            @roundNum.each do |num|
                puts num+", "
            end
        end

            
    
    end

    def findMaxHandSize(numPlayers)
        maxHandSize = 1
        while maxHandSize * numPlayers < 52 && maxHandSize < 10 do
            maxHandSize = maxHandSize + 1
        end
        maxHandSize = maxHandSize-1 #do this because we always add one more than possible
        print "\nMax hand size: #{maxHandSize}"
    end
    
end

class Player
    @hand
    @tricks
    @score = []
end

=begin
#Controls the behaviour of the game

1. Designate the "dealer"
2. hand out the number of cards to each player, designated by roundNum array
3. Player after dealer starts the bidding process
4. Final player can't bid a number that makes all bids equal the round number (someone always needs a blackball - score of 0 )
5. player who bid th highest goes first
5.5 players must play a card that matches the suit the first player plays
6. Player who plays highest card or highest trump wins the "trick"
7. Can't play a trump card unless its been played before
8. Begin again at the player who won the trick
9/ continue until all cards in players hands are gone
10. Start the next round with different trump and round number
=end
class GameController


end
#Main program below
puts "\nHello, this is Blackball! How many players?"
numPlayers = gets
numPlayers = numPlayers.to_i

puts "\nPlaying with #{numPlayers} players. "

game = Blackball.new(numPlayers)