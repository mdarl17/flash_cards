require 'pry'
require './lib/round'
require 'csv'

def start

  CSV::Converters[:symbol] = ->(value) { value.to_sym rescue value }

  questions = CSV.parse(File.read("qa_input.csv"), headers: true).by_col[0]
  answers = CSV.parse(File.read("qa_input.csv"), headers: true).by_col[1]
  categories = CSV.parse(File.read("qa_input.csv"), headers: true, converters: :symbol).by_col[2]

  card_1 = Card.new(questions[0], answers[0], categories[0])
  card_2 = Card.new(questions[1], answers[1], categories[1])
  card_3 = Card.new(questions[2], answers[2], categories[2])
  card_4 = Card.new(questions[3], answers[3], categories[3])
  card_5 = Card.new(questions[4], answers[4], categories[4])
  card_6 = Card.new(questions[5], answers[5], categories[5])
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