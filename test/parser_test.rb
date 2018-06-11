require "minitest/autorun"
require "./src/parser"

class TestParser < Minitest::Test
  def test_format_reads_data_into_hash
    parser = Parser.new("./questions.csv")
    expected_questions = [
      {:strand_id=>"1", :strand_name=>"Nouns", :standard_id=>"1", :standard_name=>"Common Nouns", :question_id => "1", :"difficulty"=>"0.7"},
      {:strand_id=>"1", :strand_name=>"Nouns", :standard_id=>"1", :standard_name=>"Common Nouns", :question_id => "2", :"difficulty"=>"0.6"}, 
      {:strand_id=>"1", :strand_name=>"Nouns", :standard_id=>"2", :standard_name=>"Abstract Nouns", :question_id => "3", :"difficulty"=>"0.8"}, 
      {:strand_id=>"1", :strand_name=>"Nouns", :standard_id=>"3", :standard_name=>"Proper Nouns", :question_id => "4", :"difficulty"=>"0.2"}, 
      {:strand_id=>"1", :strand_name=>"Nouns", :standard_id=>"3", :standard_name=>"Proper Nouns", :question_id => "5", :"difficulty"=>"0.5"}, 
      {:strand_id=>"1", :strand_name=>"Nouns", :standard_id=>"3", :standard_name=>"Proper Nouns", :question_id => "6", :"difficulty"=>"0.4"}, 
      {:strand_id=>"2", :strand_name=>"Verbs", :standard_id=>"4", :standard_name=>"Action Verbs", :question_id => "7", :"difficulty"=>"0.9"}, 
      {:strand_id=>"2", :strand_name=>"Verbs", :standard_id=>"4", :standard_name=>"Action Verbs", :question_id => "8", :"difficulty"=>"0.1"}, 
      {:strand_id=>"2", :strand_name=>"Verbs", :standard_id=>"5", :standard_name=>"Transitive Verbs", :question_id => "9", :"difficulty"=>"0.3"}, 
      {:strand_id=>"2", :strand_name=>"Verbs", :standard_id=>"5", :standard_name=>"Transitive Verbs", :question_id => "10", :"difficulty"=>"0.6"}, 
      {:strand_id=>"2", :strand_name=>"Verbs", :standard_id=>"5", :standard_name=>"Transitive Verbs", :question_id => "11", :"difficulty"=>"0.4"}, 
      {:strand_id=>"2", :strand_name=>"Verbs", :standard_id=>"6", :standard_name=>"Reflexive Verbs", :question_id => "12", :"difficulty"=>"0.2"}
  ]

  assert_equal expected_questions, parser.format
  end
end