require './lib/card'
require './lib/deck'
require './lib/turn'

class Round
  attr_reader :deck, :number_correct, :index
  attr_accessor :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @index = 0
  end

  def current_card
    @deck.cards[@index]
  end

  def take_turn(guess)
    if current_card 
      @turns.push(Turn.new(guess, current_card))
      @number_correct += 1 if @turns.last.correct?
      @index += 1
      "Current index is: #{@index}"
      @turns.last
    else
      'We ain\'t got no more cards'
    end
  end

  def percent_correct
    (@number_correct.to_f / @turns.length*100).round(2).to_s + '%'
  end

  def percent_correct_by_category(category)
    (@turns.select{ |turn| 
      turn.card.category == category && turn.correct?
  }.length.to_f / @deck.cards_in_category(category).length*100).round(2).to_s + '%'
  end
end

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)

round.take_turn("Juneau")
round.take_turn("Mars")

puts "round.deck"
puts round.deck

puts "round.turns"
puts "current_card"
puts round.current_card.question

round.take_turn("East")
# round.take_turn("no card")

puts "round.turns"
puts round.turns

# puts "round.number_correct"
# puts round.number_correct

# puts "round.current_card"
# puts round.current_card

# puts "round.take_turn(`Venus`)"
# puts round.take_turn('Venus')

# puts "round.turns.count"
# puts round.turns.count

# puts "round.turns.last.feedback"
# puts round.turns.last.feedback

# puts "round.number_correct"
# puts round.percent_correct

# puts "round.percent_correct_by_category(:STEM)"
# puts round.percent_correct_by_category(:STEM)

puts "Total percentage correct:"
puts round.percent_correct

puts "round.percent_correct_by_category(:Geography)"
puts round.percent_correct_by_category(:Geography)

puts "round.percent_correct_by_category(:STEM)"
puts round.percent_correct_by_category(:STEM)








