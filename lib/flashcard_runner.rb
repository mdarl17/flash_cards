require 'pry'
require './lib/round'

def start
  qa_array = [
    {
      q: 'What name is singer-actor Stefani Germanotta better known by?', a: 'Lady Gaga', c: 'Music'
    }, {
      q: 'What was the very first video ever played on MTV?',
      a: 'Video killed the radio star', c: 'Music'
    }, {
      q: 'Which Italian town is the setting for Shakespeare\'s Romeo and Juliet?',
      a: 'Verona', c: 'Literature'
  }, {
      q: 'Who was the first American woman in space?',
      a: 'Sally Ride', c: 'History'
  }, {
      q: 'Who is the youngest Oscar winner of all time?',
      a: 'Tatum O\'Neal', c: 'Movies'
  }, {
      q: 'Actor Nicolas Cage is the nephew of what famous director?',
      a: 'Francis Ford Coppola', c: 'Movies'
  }]

  card_1 = Card.new(qa_array[0][:q], qa_array[0][:a], qa_array[0][:c])
  card_2 = Card.new(qa_array[1][:q], qa_array[1][:a], qa_array[1][:c])
  card_3 = Card.new(qa_array[2][:q], qa_array[2][:a], qa_array[2][:c])
  card_4 = Card.new(qa_array[3][:q], qa_array[3][:a], qa_array[3][:c])
  card_5 = Card.new(qa_array[4][:q], qa_array[4][:a], qa_array[4][:c])
  card_6 = Card.new(qa_array[5][:q], qa_array[5][:a], qa_array[5][:c])
  deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6])
  round = Round.new(deck)
  puts ""
  puts "Welcome! You're playing with #{round.deck.count} cards."
  puts "---------------------------------------"
  puts "This is card number #{round.turns.length + 1} of #{round.deck.count}"
  # + 1} of #{round.deck.count}."
end

start