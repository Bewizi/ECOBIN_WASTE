import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key, required this.headingText, required this.color});

  final String headingText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      headingText,
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: color),
    );
  }
}

class SubText extends StatelessWidget {
  const SubText({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 18, color: color));
  }
}
