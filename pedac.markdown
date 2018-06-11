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

#### Classes

1. QuestionFilter
  1. Has a filter method. Take an argument that specifies how to filter the existing questions.

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
  3. Has a filter

### Algorithm

#### Data Organization

1. Create a new quiz. When initialized, it calls `generate` to organize data. 
2. Read in the entire questions.csv file into the quiz and pass the number of questions to find.
  1. Pass in the file name to parse.
3. Organize underlying data for the quiz.
  1. Create questions
  2. Create standards
  3. Create strands
4. Cycle through strands until all relevant question ids are found. 
  1. Aternate taking one question from each strand.
  2. Exception: If the number of questions requested is odd, add an additional
  question from the last strand in the set of strands.
5. Display the collected question ids to the user by calling `show`, which formats
and displays the collection of question id number created in `generate`.

#### Example usage

*If this is organized as a 1:M relationship with collaborators.*

1. Grab all questions from strand 1
  1. quiz.strands.first -> strand.standards.each -> standard.questions
  2. quiz.questions.select -> standard.id 1
2. Generate 1 question
  1. quiz.questions.first -> id

*If this is organized as a M:M relationship between questions, strands,
and standards. 1:M and 1:1 for questions and quiz.

1. Generate 2 questions
  1. questions.sort_by(standard)
  2. Add question from standard 1
  2. Add question from standard 2

2. Generate n questions
  1. questions.sort_by(standard)
  2. Add question from standard 1
  3. Add question from standard 2 
  4. Add question from standard 1
  5. Add question from standard 2
  6. Is the number of question requested odd?
    1. If so, when the number of questions added is one less than the number
    requested, add an additional question from last standard.

### Code (with intent)

See script and tests.