require "./parser.rb"
require "./question.rb"
require "./strand.rb"
require "./standard.rb"

class Quiz
  attr_reader :questions, :strands

  def initialize(data_file)
    @questions = []
    @strands = []
    @standards = []
    @question_data = Parser.new(data_file).format
    # binding.irb
    post_initialize
  end

  def generate(question_count)
    question_ids = []
    question_count.times do |count|
      strands.each do |strand|
        question_ids << strand.questions[count].id
        break if question_ids.size == question_count
      end
    end

    question_ids.join(",")
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