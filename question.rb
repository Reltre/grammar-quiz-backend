class Question
  attr_reader :id, :difficulty

  def initialize(metadata)
    @id = metadata[:question_id]
    @difficulty = metadata[:difficulty]
  end
end