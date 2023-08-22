class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
      @guess = guess
      @card = card
  end

  def correct?
      guess == card.answer
  end

  def feedback
      correct? ? "Correct!" : "Incorrect."
  end

  def method_missing(method, *args)
    puts "Sorry, I don't know any #{method} method."
  end
end