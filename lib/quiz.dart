import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/result.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/question_screen.dart';

const bgColor = Color.fromARGB(255, 78, 14, 156);
List<Color> backgroundGradientColor = [
  Colors.purple.shade800,
  Colors.purple.shade900,
];

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> userChoices = [];

  void startQuiz() {
    setState(() {
      userChoices.clear();
      activeScreen = QuestionScreen(endQuiz);
    });
  }

  void endQuiz(List<String> userChoices) {
    setState(() {
      this.userChoices.addAll(userChoices);
      activeScreen = ResultsScreen(
        restartQuiz: startQuiz,
        quizResult: this
            .userChoices
            .asMap()
            .entries
            .map((element) => Result(
                questions[element.key].question,
                questions[element.key].choices,
                element.value,
                questions[element.key].choices[0] == element.value))
            .toList(),
      );
    });
  }

  @override
  void initState() {
    activeScreen = StartScreen(startQuiz);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: bgColor,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: backgroundGradientColor,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
