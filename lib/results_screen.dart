import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/result.dart';
import 'package:quiz_app/result_item.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.restartQuiz,
    required this.quizResult,
  });

  final List<Result> quizResult;
  final void Function() restartQuiz;

  @override
  Widget build(BuildContext context) {
    int correctCount = quizResult
        .where(
          (element) => element.isCorrect,
        )
        .length;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Here are the resuls of the Quiz (${correctCount.toString()} / ${quizResult.length.toString()})',
            style: GoogleFonts.titilliumWeb(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 500,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: quizResult.map((e) => ResultItem(e)).toList(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: restartQuiz,
            label: const Text('Retake Quiz'),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
