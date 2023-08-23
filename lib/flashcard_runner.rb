require 'pry'
require '.lib/round'

class Flashcard
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

round = Flashcard.new("test")
puts round
# @card = Card.new("What is your name?", "Dildo", :Personal)
# puts round
# binding.pry

