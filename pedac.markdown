### Problems and Rules

- Given an input for the number of questions, select the appropriate distribution
of questions based on the data present (question.csv)

- If a use asks for an odd number of questions, it's ok to put 1 question from
strand 1 and 2 questions from strand 2.

- This program accepts a number of questions greater than zero.

- Put the same number of questions from each strand's standard.

- If possible, prefer putting in each question at least once, before adding duplicates.

- It is ok to add duplicates if you have.

### Examples/Tests

- Given 1 as an input, return the question_id of *one* quiz question from one strand.

- Given an even-valued input, return *2n* question_ids, each from different standards and different
strands when possible.

- Given an odd-valued input, return an odd number of question ids from strand 1 and an even number from
strand 2.

- Given an input value that asks for more questions than there are data for, return duplicate values.


### Data Structure(s)

1 array that stores each question from the data as a string element.

1 nested hash that stores each question by question id. The question id
points to another hash that has data corresponding to each question.
Each standard will have an additional field marking whether that question has
been selected or not.

1 array to store question_ids, to be stringified and returned to the user as the end result.

1 integer for the number of question chosen.

1 hash representing the various strands how many question from each strand have
been chosen.

#### Classes

1. QuestionFilter
  1. Has a number of questions to filter
  2. Takes  

2. Strand
  1. Has an id
  2. Has a name
  3. Has a list of standards
  4. Class variable of current ids

3. Standard
  1. Has an id
  2. Has a name
  3. Has a list of questions
  4. Class level variable of current ids

4. Question
  1. Has an id
  2. Has a difficulty 
  3. Class level variable of current ids.

5. Quiz
  1. Has a parser
  2. Has an array or strands.

### Algorithm

#### Data Organization

1. Create a new quiz. When initialized, it calls parser to organize data for it. 
2. Read in the entire questions.csv file into a Parser.
  1. Pass in the file name to parse.
  2. Call `Parser.parse` which takes a local file to parse and then reads
  in that file, organized as an array of question hashes.
3. Creates strands for the quiz
  1. The quiz class creates iterates through the question data
  and organizes it by strand.
  2. Cache relevant data related to the strand: id and name.
4. When creating a strand, create a list of standards for it.
  1. Pass the question data along, grabbing each piece of information
  related to this standard: id, and name.
  2. Associate a list of questions for that standard.
5. Create a Question as part of the association to each standard.
  1. A question should have id and a difficulty.

#### Example usage

1. Grab all questions from strand 1
  1. quiz.strands.first -> strand.standards.each -> standard.questions
  2. quiz.questions.select -> standard.id 1
2. Generate 1 question
  1. quiz.questions.first -> id
3. Generate 2. questions
  1. quiz.questions.each ->
  2. question.standard -> 1 && question.strand -> 1 -> Add to quiz
  3. question.standard -> n > 1 && question.strand -> 2 -> Add to quiz


### Code (with intent)

See script and tests.

> Note, I believe I spent too much time on the implementation details. Thanks for looking
over my code!