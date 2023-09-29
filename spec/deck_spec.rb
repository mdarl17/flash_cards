require 'rspec'
require './lib/card'
require './lib/deck'

describe Deck do
  describe '#initialize' do
    it 'is an instance of Deck' do
      deck = Deck.new
      expect(deck).to be_a Deck
    end

    it 'can store an array of cards' do
      # deck = Deck.new(card)
      deck = Deck.new
      expect(deck.cards).to be_a Array
    end

    it 'can be instantiated without any Card arguments.' do
      deck = Deck.new
      expect(deck.cards.empty?).to be true
    end

    it 'can be insantiated with Card objects' do
      card_1 = Card.new("Q1", "A1", "Cat1")
      card_2 = Card.new("Q2", "A2", "Cat2")
      card_3 = Card.new("Q3", "A3", "Cat3")
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      expect(deck.cards.count).to eq(3)
      expect(deck.cards.first).to eq(card_1)
    end

    it 'can have card objects added after intialization' do
      card_1 = Card.new("Q1", "A1", "Cat1")
      card_2 = Card.new("Q2", "A2", "Cat1")
      card_3 = Card.new("Q3", "A2", "Cat3")
      card_4 = Card.new("Q4", "A4", "Cat4")
      deck = Deck.new([card_1, card_2])
      expect(deck.count).to eq(2)
      deck.add_cards([card_3, card_4])
      expect(deck.count).to eq(4)
    end
  end

  describe "filter_categories" do
    it 'can group cards #by_category' do
      card_1 = Card.new("Q1", "A1", "Cat1")
      card_2 = Card.new("Q2", "A2", "Cat1")
      card_3 = Card.new("Q3", "A2", "Cat3")
      card_4 = Card.new("Q4", "A4", "Cat4")
      deck = Deck.new([card_1, card_2, card_3, card_4])
      expect(deck.filter_categories("Cat1").count).to eq(2)
    end
  end
end