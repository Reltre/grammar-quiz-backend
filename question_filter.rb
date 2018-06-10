class QuestionFilter
  attr_reader :strands

  def initialize
    @questions_hash = {}
    @selected_questions = []
    @strands = []
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
    # iterate through the questions hash, selecting question in alternating
    # by strand
    @questions_hash.cycle do |question_id, question_details|
      question_details
      break if @selected_questions.size >= number
      strand_id = question_details[:strand_id]

      if strands[strand_id] <= strands.values.max.to_i
        @selected_questions << question_id
      end

      
      strands[strand_id] += 1
    end
    @selected_questions
  end

  def print
    return @selected_questions.join(",")
  end
end