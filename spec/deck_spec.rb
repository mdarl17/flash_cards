require 'rspec'
require './lib/deck'

describe Deck do
  describe '#initialize' do
    it 'is an instance of Deck' do
      deck = Deck.new(cards)
      expect(deck).to be_a Deck
    end
    
    it 'holds an array of trivia cards' do
      deck = Deck.new(cards)
      expect(deck.cards).to be_a Array
    end
  end
end