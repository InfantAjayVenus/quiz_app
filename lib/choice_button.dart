import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  const ChoiceButton(this.choiceText, this.clickHandler, {super.key});

  final String choiceText;
  final void Function() clickHandler;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        clickHandler();
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Text(
        choiceText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
