import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String text;

  const TitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF4F46E5), // Violet blue color matching mockup
        fontWeight: FontWeight.w700,
        fontSize: 20,
        letterSpacing: 0.3,
        height: 1.4,
      ),
    );
  }
}
