require "minitest/autorun"
require "./src/quiz"


module QuizTests
  class TestQuizGenerationByStrand < Minitest::Test
    def test_adds_a_question_from_first_strand
      quiz = Quiz.new("questions.csv", "1")
      strand_1 = quiz.strands.first
      question = strand_1.questions.first 
      assert_equal question.id, quiz.generate.first
    end
  end
end