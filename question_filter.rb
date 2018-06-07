class QuestionFilter

  def self.parse(questions)
    # Parse data into a hash, organized by question id
    questions_hash = {}
    questions.each do |question|
      question_arr = question.split(',')
      question_id = question_arr[-2]
      question_hash = {}
      
      fields.each_with_index do |field, index|
        next if field == "question_id"
        question_hash[field.to_sym] = question_arr[index]
      end
      
      questions_hash[question_id] = question_hash
    end
    questions_hash
  end

  def self.filter(number)
    
  end
end