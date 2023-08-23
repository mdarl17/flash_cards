require './lib/card'

class Deck
attr_reader :cards

def initialize(cards)
  @cards = cards
  end

  def count
    @cards.length
  end
  
  def cards_in_category(category)
    @cards.select{ |card| 
      card.category == category
    }
  end
end

# card = Card.new("Que", "Ans", "Sub")
# cards = []
# 3.times do |n|
#   card = Card.new("Q:#{n+1}", "A:#{n+1}", "Cat:#{n+1}")
#   cards << card
# end

# p cards
