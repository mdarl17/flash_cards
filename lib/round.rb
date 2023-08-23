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
      "Sorry \'#{guess}\', we ain\'t got no more cards. Please play again."
    end
  end

  def percent_correct
    (@number_correct.to_f / @turns.length*100).round(2).to_s + '%'
  end

  def percent_correct_by_category(category)
    (@turns.select{ |turn| 
      turn.card.category == category && turn.correct?
  }.length.to_f / @deck.filter_categories(category).length*100).round(2).to_s + '%'
  end
end