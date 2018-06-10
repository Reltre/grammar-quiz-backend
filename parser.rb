class Parser
  def self.format(question_data)
    questions = question_data.split("\n")
    fields = questions.shift.split(",")
    formatted_questions = []

    questions.each do |question|
      question_arr = question.split(',')
      question_hash = {}
      
      fields.each_with_index do |field, index|
        question_hash[field.to_sym] = question_arr[index]
      end
      formatted_questions << question_hash
    end
    formatted_questions
  end
end