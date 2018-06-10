require "./parser.rb"
require "./question.rb"

class Quiz
  attr_reader :questions, :strands

  def initialize(data_file)
    @questions = []
    @question_data = Parser.new(data_file).format
    binding.irb
    post_initialize
  end

  def generate(question_count)
    question_ids = []
    question_count.times do |count|
      strands.each do |strand|
        question_ids << strand.questions[count].id
      end
    end

    question_ids
  end

  private

  def post_initialize
    populate_questions
    # populate_standards
    # populate_strands
  end

  def populate_questions
    @question_data.each do |question_meta_data|  
      @questions << Question.new(question_meta_data)
    end
  end

  # def populate_standards
  #   @question_data.each do |question_meta_data|  
  #     @standards << Standard.new(question_meta_data)
  #   end
  # end

  # def populate_strands
  #   @question_data.each do |question_meta_data|  
  #     @standards << Strand.new(question_meta_data)
  #   end
  # end
end