import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/choice_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.onQuizComplete, {super.key});

  final void Function(List<String>) onQuizComplete;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  List<String> userChoices = [];

  void selectChoice(String userChoice) {
    setState(() {
      userChoices.add(userChoice);

      if (currentQuestionIndex != questions.length - 1) {
        currentQuestionIndex++;
      } else {
        widget.onQuizComplete(userChoices);
      }
    });
  }

  // static const double buttonGap = 10;
  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.titilliumWeb(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.shuffledChoices.map(
              (choiceItem) => ChoiceButton(
                choiceItem,
                () {
                  selectChoice(choiceItem);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
