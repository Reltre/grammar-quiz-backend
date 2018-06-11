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

    def test_adds_one_question_from_each_strand
      quiz = Quiz.new("questions.csv", "2")
      strand_1 = quiz.strands.first
      question_1 = strand_1.questions.first

      strand_2 = quiz.strands.last
      question_2 = strand_2.questions.first 

      assert_equal [question_1.id, question_2.id], quiz.generate 
    end
  end
end