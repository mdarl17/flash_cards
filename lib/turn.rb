require './lib/card'
require 'pry'

class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
      @guess = guess
      @card = card
  end

  def correct?
      # guess == card.answer
      guess[1] == card.answer[1]
  end

  def feedback
      correct? ? "Correct!" : "Incorrect."
  end
end

card1 = Card.new("Q1", "A1", "C1")
card2 = Card.new("Q2", "A1", "C1")
card3 = Card.new("Q3", "A3", "C3")

turn_1 = Turn.new("A2", card3)


