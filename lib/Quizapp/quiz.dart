import 'dart:io';

void main() {
  List<Question> questions = [
    Question(
      title: 'What is the capital of France?',
      options: ['Paris', 'London', 'Berlin', 'Madrid'],
      correctIndexes: [0],
      isMultipleChoice: false,
    ),
    Question(
      title: 'Which of the following are programming languages?',
      options: ['Python', 'HTML', 'Java', 'CSS'],
      correctIndexes: [0, 2],
      isMultipleChoice: true,
    ),
    Question(
      title: 'What is 2 + 2?',
      options: ['3', '4', '5', '6'],
      correctIndexes: [1],
      isMultipleChoice: false,
    ),
    Question(
      title: 'Which of these are fruits?',
      options: ['Apple', 'Carrot', 'Banana', 'Cucumber'],
      correctIndexes: [0, 2],
      isMultipleChoice: true,
    ),
    Question(
      title: 'Who wrote "Romeo and Juliet"?',
      options: ['Shakespeare', 'Hemingway', 'Dickens', 'Tolkien'],
      correctIndexes: [0],
      isMultipleChoice: false,
    ),
  ];

  List<Participant> participants = [];  //participants is the name of the list. It helps us know that this box is for storing participants of the quiz.
 
  while (true) {
    print('Welcome to the Quiz App!');
    print('Please enter your first name:');
    String firstName = stdin.readLineSync() ?? '';
    print('Please enter your last name:');
    String lastName = stdin.readLineSync() ?? '';

    Participant participant = Participant(firstName, lastName);
    int score = 0;

    for (var question in questions) {
      print(question.title);
      for (int i = 0; i < question.options.length; i++) {
        print('${i + 1}: ${question.options[i]}');
      }

      List<int> selectedOptions = [];
      String input = stdin.readLineSync() ?? '';

      if (question.isMultipleChoice) {
        print('Enter the numbers of the correct options separated by commas (e.g., 1,3):');
        input = stdin.readLineSync() ?? '';
        selectedOptions = input.split(',').map((e) => int.tryParse(e.trim()) ?? -1).toList();
      } else {
        int selectedOption = int.tryParse(input) ?? -1;
        if (selectedOption > 0 && selectedOption <= question.options.length) {
          selectedOptions.add(selectedOption - 1);
        }
      }

      if (areSelectionsCorrect(selectedOptions, question.correctIndexes, question.isMultipleChoice)) {
        print('Correct!');
        score++;
      } else {
        print('Wrong! The correct answer(s): ${question.correctAnswers}');
      }
      print('---');
    }

    participant.score = score;
    participants.add(participant);
    print('Your final score is $score out of ${questions.length}.');
    print('---');

    print('Do you want to add another participant? (yes/no)');
    if (stdin.readLineSync()?.toLowerCase() != 'yes') break;
  }

  print('Participants and their scores:');
  for (var participant in participants) {
    print('${participant.firstName} ${participant.lastName}: ${participant.score}');
  }
}

class Question {
  String title;
  List<String> options;
  List<int> correctIndexes;
  bool isMultipleChoice;

  Question({
    required this.title,
    required this.options,
    required this.correctIndexes,
    required this.isMultipleChoice,
  });

  List<String> get correctAnswers => correctIndexes.map((index) => options[index]).toList();
}

class Participant {
  String firstName;
  String lastName;
  int score = 0;

  Participant(this.firstName, this.lastName);
}

bool areSelectionsCorrect(List<int> selectedOptions, List<int> correctIndexes, bool isMultipleChoice) {
  if (isMultipleChoice) {
    return correctIndexes.toSet().difference(selectedOptions.toSet()).isEmpty &&
           selectedOptions.toSet().difference(correctIndexes.toSet()).isEmpty;
  } else {
    return selectedOptions.length == 1 && selectedOptions[0] == correctIndexes[0];
  }
}