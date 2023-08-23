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


