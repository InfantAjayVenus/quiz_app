import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/result.dart';

class ResultItem extends StatelessWidget {
  const ResultItem(this.result, {super.key});

  final Result result;

  @override
  Widget build(BuildContext context) {
    bool isCorrect = result.choices[0] == result.userChoice;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            child: Icon(
              isCorrect ? Icons.check_circle : Icons.cancel,
              size: 27.5,
              color: isCorrect ? Colors.green.shade300 : Colors.red.shade300,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    result.question,
                    style: GoogleFonts.titilliumWeb(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    result.choices[0],
                    style: GoogleFonts.titilliumWeb(
                      color: Colors.greenAccent,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    result.userChoice,
                    style: GoogleFonts.titilliumWeb(
                      color: Colors.deepPurpleAccent.shade100,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
