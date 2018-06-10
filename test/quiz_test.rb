require "minitest/autorun"
require "./quiz"


module QuizTests
  class TestQuizGenerationByStrand < Minitest::Test
    # def setup
    #   @quiz = Quiz.new(1, "questions.csv")
    # end

    def test_adds_a_question_from_first_strand
      quiz = Quiz.new("questions.csv")
      strand_1 = quiz.strands.first
      question = strand_1.questions.first 
      assert_equal question.id, quiz.generate(1)
    end

    # def test_quiz_generation_for_two_questions
    #   quiz = Quiz.new(2, "questions.csv")
    #   assert_equal "1,7", quiz.generate
    # end
  end
end