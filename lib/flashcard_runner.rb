require 'pry'
require './lib/round'

def start
  qa_array = [
    {
      q: 'What name is singer-actor Stefani Germanotta better known by?', a: 'Lady Gaga'
    }, {
      q: 'What was the very first video ever played on MTV?',
      a: 'Video killed the radio star'
    }, {
      q: 'Which Italian town is the setting for Shakespeare\'s Romeo and Juliet?',
      a: 'Verona'
  }, {
      q: 'Who was the first American woman in space?',
      a: 'Sally Ride'
  }, {
      q: 'Who is the youngest Oscar winner of all time?',
      a: 'Tatum O\'Neal'
  }, {
      q: 'Actor Nicolas Cage is the nephew of what famous director?',
      a: 'Francis Ford Coppola'
  }]

  card_1 = Card.new(qa_array[0][:q], qa_array[0][:a], :Music)
  card_2 = Card.new(qa_array[1][:q], qa_array[1][:a], :Music)
  card_3 = Card.new(qa_array[2][:q], qa_array[2][:a], :Literature)
  card_4 = Card.new(qa_array[3][:q], qa_array[3][:a], :History)
  card_5 = Card.new(qa_array[4][:q], qa_array[4][:a], :Movies)
  card_6 = Card.new(qa_array[5][:q], qa_array[5][:a], :Movies)
  deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6])
  round = Round.new(deck)
  puts ""
  puts "Welcome! You're playing with #{round.deck.count} cards."
  puts "--------------------------------------"
  
  def play_game(round)
    puts "This is card number #{round.turns.length + 1} of #{round.deck.count}."
    puts ""
    puts "Question: #{round.current_card.question}"
    user_guess = gets.chomp
    puts round.take_turn(user_guess).feedback
  end
  (round.deck.cards.length).times{ play_game(round) }
      puts "***********  GAME OVER  ***********"
      puts "You had #{round.total_correct} correct guesses out of #{round.turns.length} for a total score of #{round.percent_correct}."
      round.deck.cards.map{|card| card.category}.uniq.each{|cat|
        puts "#{cat} - #{round.percent_correct_by_category(cat)}"
      }
end

start