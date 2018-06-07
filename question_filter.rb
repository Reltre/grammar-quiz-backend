class QuestionFilter
  def initialize
    @questions_hash = {}
    @selected_questions = []
  end

  # Parse data into a hash, organized by question id
  def parse(questions, fields)
    questions.each do |question|
      question_arr = question.split(',')
      question_id = question_arr[-2]
      question_hash = {}
      
      fields.each_with_index do |field, index|
        next if field == "question_id"
        question_hash[field.to_sym] = question_arr[index]
      end
      
      @questions_hash[question_id] = question_hash
    end
    @questions_hash
  end

  def filter(number)
    # @questions_hash
  end

  def print
    return @selected_questions
  end
end