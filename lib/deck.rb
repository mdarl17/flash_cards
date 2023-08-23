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

card_1 = Card.new("Q1", "A1", "Cat1")
card_2 = Card.new("Q2", "A2", "Cat1")
card_3 = Card.new("Q3", "A2", "Cat3")
card_4 = Card.new("Q4", "A4", "Cat4")

deck = Deck.new([card_1, card_2])
deck.add_cards([card_3, card_4])

p deck.filter_categories("Cat1").count

# puts deck.count
# p deck