class Card
    attr_reader :question, :answer, :category
    
    def initialize(question, answer, category)
        @question = question
        @answer = answer
        @category = category
    end

    def method_missing(method, *args)
      puts "Sorry, I don't know any #{method} method."
    end
end