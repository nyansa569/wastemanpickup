import 'package:flutter/material.dart';

//! Welcome widget
class WelcomeText extends StatelessWidget {
  final String text;
  WelcomeText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
