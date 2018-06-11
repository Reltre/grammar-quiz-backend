class Strand
  def initialize(metadata)
    @id = metadata[:strand_id]
    @name = metadata[:strand_name]
    @question_ids = []
  end

  def add_question(question_data)
    @question_ids << question_data[:question_id]
  end

  def questions
    @question_ids.each_with_object([]) do |id, questions_arr|
      questions_arr << Question.find(id)
    end
  end
end