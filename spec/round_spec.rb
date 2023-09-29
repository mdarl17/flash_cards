require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'
require 'pry'

describe Round do
  describe '#initialize' do
    it 'is an instance of Round' do
      card_1 = Card.new("Q1", "A1", "C1")
      card_2 = Card.new("Q2", "A1", "C1")
      card_3 = Card.new("Q3", "A3", "C3")
      card_4 = Card.new("Q4", "A4", "C4")
      card_5 = Card.new("Q5", "A6", "C1")
      deck_1 = Deck.new([card_1, card_2, card_3, card_4, card_5])

      expect(Round.new(deck_1)).to be_a Round
    end

    it 'has a deck of cards' do
      card_1 = Card.new("Q1", "A1", "C1")
      card_2 = Card.new("Q2", "A1", "C1")
      card_3 = Card.new("Q3", "A3", "C3")
      card_4 = Card.new("Q4", "A4", "C4")
      card_5 = Card.new("Q5", "A6", "C1")
      deck_1 = Deck.new([card_1, card_2, card_3, card_4, card_5])
      
      expect(deck_1).to be_a Deck
    end

  describe 'how the game is played' do
    it 'keeps track of turns' do
      card_1 = Card.new("Q1", "A1", "C1")
      card_2 = Card.new("Q2", "A1", "C1")
      card_3 = Card.new("Q3", "A3", "C3")
      card_4 = Card.new("Q4", "A4", "C4")
      card_5 = Card.new("Q5", "A6", "C1")
      deck_1 = Deck.new([card_1, card_2, card_3, card_4, card_5])
      round_1 = Round.new(deck_1)
      expect(round_1.take_turn("C1")).to be_a Turn
    end
  end
end
end