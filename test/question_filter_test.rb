require "minitest/autorun"
require "question_filter"

class TestQuestionFilter < Minitest::Test
  def setup
    @question_data = IO.readlines("./questions.csv")
    @fields = questions.shift.split(",")
    @filter = filter = QuestionFilter.new
  end

  def test_parse_reads_in_question_data
    
  end

  def teardown
    # teardown
  end
end