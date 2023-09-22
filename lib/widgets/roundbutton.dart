import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  RoundButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(), // Use CircleBorder to make it circular
        padding: EdgeInsets.all(25.0), // Adjust padding as needed
      ),
    );
  }
}
