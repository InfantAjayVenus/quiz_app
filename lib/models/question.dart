class Question {
  const Question(this.question, this.choices);

  final String question;
  final List<String> choices;

  List<String> get shuffledChoices {
    final List<String> shufflingChoices = List.of(choices);
    shufflingChoices.shuffle();
    return shufflingChoices;
  }
}
