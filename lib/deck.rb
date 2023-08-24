require './lib/card'

class Deck
attr_reader :cards

def initialize(cards=[])
  @cards = cards
  end

  def add_cards(card_input)
    card_input.kind_of?(Array) ? @cards.concat(card_input) : @cards << card_input
  end

  def count
    @cards.length
  end
  
  def filter_categories(category)
    @cards.select{ |card| 
      card.category == category
    }
  end
end