class Standard
  def initialize(question_meta_data)
    @id = question_meta_data[:standard_id]
    @name = question_meta_data[:standard_name]
    @question_ids = []
  end

  def add_question(question_data)
    @question_ids << question_data[:question_id]
  end
end