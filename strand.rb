class Strand
  attr_reader :questions

  def initialize(metadata)
    @id = metadata[:id]
    @name = metadata[:strand_name]
    @question_ids = []
  end

  def add_question(question_data)
    @question_ids << quesiton_data[:question_id]
  end
end