require "minitest/autorun"
require "./src/quiz"


module QuizTests
  class TestQuizGenerationByStrand < Minitest::Test
    def test_adds_a_question_from_first_strand
      quiz = Quiz.new("questions.csv", "1")
      strand_1 = quiz.strands.first
      question = strand_1.questions.first 
      assert_equal [question.id], quiz.generate
    end

    def test_adds_one_question_from_each_strand
      quiz = Quiz.new("questions.csv", "2")
      strand_1 = quiz.strands.first
      question_1 = strand_1.questions.first

      strand_2 = quiz.strands.last
      question_2 = strand_2.questions.first 

      assert_equal [question_1.id, question_2.id], quiz.generate 
    end


    def test_adds_one_question_from_first_two_from_second_strand
      quiz = Quiz.new("questions.csv", "3")
      strand_1 = quiz.strands.first
      question_1 = strand_1.questions.first

      strand_2 = quiz.strands.last
      question_2, question_3 = strand_2.questions[0..1] 

      assert_equal [question_1.id, question_2.id, question_3.id], quiz.generate 
    end

    def test_many_even_number_of_questions
      quiz = Quiz.new("questions.csv", "6")
      strand_1 = quiz.strands.first
      strand_2 = quiz.strands.last
      question_set_1 = strand_1.questions[0..2]
      question_set_2 = strand_2.questions[0..2]

      questions = question_set_1.zip(question_set_2).flatten
      question_ids = questions.map(&:id)
      assert_equal question_ids, quiz.generate
    end

    def test_many_odd_number_of_questions
      quiz = Quiz.new("questions.csv", "7")
      strand_1 = quiz.strands.first
      strand_2 = quiz.strands.last
      question_set_1 = strand_1.questions[0..2]
      question_set_2 = strand_2.questions[0..3]

      questions = question_set_1.zip(question_set_2).flatten
      questions << question_set_2.last
      question_ids = questions.map(&:id)
      assert_equal question_ids, quiz.generate
    end
  end
end