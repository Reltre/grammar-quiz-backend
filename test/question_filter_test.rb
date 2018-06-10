require "minitest/autorun"
require "./question_filter"

class TestQuestionFilter < Minitest::Test
  def setup
    @question_data = IO.readlines("./questions.csv")
    @fields = @question_data.shift.split(",")
    @filter = QuestionFilter.new
  end

  def test_parse_organizes_by_strand
    # expected_questions = {
    #   "1"=>{:strand_id=>"1", :strand_name=>"Nouns", :standard_id=>"1", :standard_name=>"Common Nouns", :"difficulty\n"=>"0.7\n"},
    #   "2"=>{:strand_id=>"1", :strand_name=>"Nouns", :standard_id=>"1", :standard_name=>"Common Nouns", :"difficulty\n"=>"0.6\n"}, 
    #   "3"=>{:strand_id=>"1", :strand_name=>"Nouns", :standard_id=>"2", :standard_name=>"Abstract Nouns", :"difficulty\n"=>"0.8\n"}, 
    #   "4"=>{:strand_id=>"1", :strand_name=>"Nouns", :standard_id=>"3", :standard_name=>"Proper Nouns", :"difficulty\n"=>"0.2\n"}, 
    #   "5"=>{:strand_id=>"1", :strand_name=>"Nouns", :standard_id=>"3", :standard_name=>"Proper Nouns", :"difficulty\n"=>"0.5\n"}, 
    #   "6"=>{:strand_id=>"1", :strand_name=>"Nouns", :standard_id=>"3", :standard_name=>"Proper Nouns", :"difficulty\n"=>"0.4\n"}, 
    #   "7"=>{:strand_id=>"2", :strand_name=>"Verbs", :standard_id=>"4", :standard_name=>"Action Verbs", :"difficulty\n"=>"0.9\n"}, 
    #   "8"=>{:strand_id=>"2", :strand_name=>"Verbs", :standard_id=>"4", :standard_name=>"Action Verbs", :"difficulty\n"=>"0.1\n"}, 
    #   "9"=>{:strand_id=>"2", :strand_name=>"Verbs", :standard_id=>"5", :standard_name=>"Transitive Verbs", :"difficulty\n"=>"0.3\n"}, 
    #   "10"=>{:strand_id=>"2", :strand_name=>"Verbs", :standard_id=>"5", :standard_name=>"Transitive Verbs", :"difficulty\n"=>"0.6\n"}, 
    #   "11"=>{:strand_id=>"2", :strand_name=>"Verbs", :standard_id=>"5", :standard_name=>"Transitive Verbs", :"difficulty\n"=>"0.4\n"}, 
    #   "12"=>{:strand_id=>"2", :strand_name=>"Verbs", :standard_id=>"6", :standard_name=>"Reflexive Verbs", :"difficulty\n"=>"0.2\n"}
    # }


    @filter.parse(@question_data, @fields)
    assert_equal ["Strand", "Strand"], @filter.strands.map(&:class)
  end

  # def test_filtering_one_question_by_strand
  #   questions = @filter.parse(@question_data, @fields)
  #   id = @filter.filter(1)
  #   assert_equal ["1"], id
  # end

  # def test_filtering_two_question_by_strand
  #   questions = @filter.parse(@question_data, @fields)
  #   ids = @filter.filter(2)
  #   assert_equal ["1","7"], ids
  # end

  # def test_filtering_three_questions_by_strand
  #   questions = @filter.parse(@question_data, @fields)
  #   ids = @filter.filter(2)
  #   assert_equal ["1","7", "8"], ids
  # end

  def test_filter_returns_duplicate_questions_on_overflow
  end

  def teardown
    # teardown
  end
end