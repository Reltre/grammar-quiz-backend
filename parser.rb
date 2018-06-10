class Parser
  def initialize(file)
    @question_data = IO.read("./questions.csv")
  end

  def format
    questions = @question_data.split("\n")
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