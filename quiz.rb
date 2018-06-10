require "./parser.rb"

class Quiz
  attr_reader :questions, :strands

  def initialize(question_count, data)
    @questions = []
    question_data = Parser.format(data)
    post_initialize
  end

  def generate
    "1"
  end

  private

  def post_initialize
    
  end

  def populate_questions
    question_data.each do |question_meta_data|  
      questions << Question.new(question_meta_data)
    end
  end
end