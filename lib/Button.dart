import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
   Button({super.key,
     required this.onPressed,
    required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
      color: Colors.white70,
      child: Text(text),
    );
  }
}
