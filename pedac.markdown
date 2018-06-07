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

1 hash representing the various stardards and how many question from each standard have
been chosen.


### Algorithm

1. Read in the entire questions.csv file.
2. Store each question as a string in an array using `IO.readlines`.
  1. For `#each` question add a new key-value pair to a data hash.
  2. Each key will be a question_id of the stringified question.
  3. Each value is the rest of the question data, along with a key-value pair representing
whether a question has been chosen or not.
3. Given the number of questions needed, iterate through each nested hash and check if
that question has been chosen. If it hasn't the add its question id to an array.
4. Repeat number 3 until n question have been chosen, where n is the number requested
by the user from the command line.
5. Join the question_id array into a string delimited by commas and return it.


### Code (with intent)

See script and tests.

> Note, I believe I spent too much time on the implementation details. Thanks for looking
over my code!