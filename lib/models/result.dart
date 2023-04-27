import "package:quiz_app/models/question.dart";

class Result extends Question {
  const Result(super.question, super.choices, this.userChoice, this.isCorrect);

  final String userChoice;
  final bool isCorrect;
}
