require "./lib/data_support"

class Question
  attr_reader :id, :difficulty
  extend DataSupport

  def initialize(metadata)
    @id = metadata[:question_id]
    @difficulty = metadata[:difficulty]
  end
end