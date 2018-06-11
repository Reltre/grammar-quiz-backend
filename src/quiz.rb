require "./src/parser.rb"
require "./src/question.rb"
require "./src/strand.rb"
require "./src/standard.rb"

class Quiz
  attr_reader :questions, :strands

  def initialize(data_file, number_of_questions)
    @questions = []
    @strands = []
    @standards = []
    @question_data = Parser.new(data_file).format
    @question_ids = []
    @number_of_questions = number_of_questions.to_i
    post_initialize
  end

  def generate
    @question_ids = []
    count = 0
    strands.cycle.with_index do |strand, index|
      count -= index
      @question_ids << strand.questions[count].id
      break if @question_ids.size == @number_of_questions
      count += 1
    end

    @question_ids
  end

  def show
    puts @question_ids.join(",")
  end

  private

  def post_initialize
    current_standard_id = 0
    current_strand_id = 0
    @question_data.each do |question_meta_data|  
      populate_questions(question_meta_data)
      populate_standards(question_meta_data, current_standard_id)
      populate_strands(question_meta_data, current_strand_id)
  
      current_standard_id = question_meta_data[:standard_id]
      current_strand_id = question_meta_data[:strand_id]
    end
  end

  def populate_questions(question_meta_data)
    @questions << Question.new(question_meta_data)
  end

  def populate_standards(question_meta_data, current_standard_id)
    if question_meta_data[:standard_id] != current_standard_id
      @standards << Standard.new(question_meta_data)
      @standards.last.add_question(question_meta_data)
    else
      @standards.last.add_question(question_meta_data)
    end
  end

  def populate_strands(question_meta_data, current_strand_id)
    if question_meta_data[:strand_id] != current_strand_id
      @strands << Strand.new(question_meta_data)
      @strands.last.add_question(question_meta_data)
    else
      @strands.last.add_question(question_meta_data)
    end
  end
end