require './lib/turn'
require 'pry'

describe Turn do
  describe 'it exists' do
    it 'is an instance of Turn' do
      card_1 = Card.new("Q1", "A1", "Cat1")
      turn = Turn.new("A1", card_1)
      expect(turn).to be_instance_of Turn
    end

    it 'has a card' do
      card_1 = Card.new("Q1", "A1", "Cat1")
      expect(card_1).to be_a Card
    end

    it 'has a guess' do
      card_1 = Card.new("Q1", "A1", "Cat1")
      turn = Turn.new("A1", card_1)
      expect(turn.guess).to eq("A1")
    end
    
    it 'can determine if the guess is correct' do
      card_1 = Card.new("Q1", "A1", "Cat1")
      turn_1 = Turn.new("A1", card_1)
      expect(turn_1.correct?).to be true
      turn_2 = Turn.new("B7", card_1)
      expect(turn_2.correct?).to be false
    end

    it 'can provide feedback about guess' do
      card_1 = Card.new("Q1", "A1", "Cat1")
      turn_1 = Turn.new("A1", card_1)
      expect(turn_1.feedback).to eq("Correct!")
      turn_2 = Turn.new("B7", card_1)
      expect(turn_2.feedback).to eq("Incorrect.")
    end
  end
end