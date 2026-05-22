import 'package:flutter/material.dart';

Widget customLogo() {
  return Container(
    width: 120,
    height: 120,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(28),
      gradient: const LinearGradient(
        colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.deepPurple.withValues(alpha: .25),
          blurRadius: 30,
          offset: const Offset(0, 12),
        ),
      ],
    ),
    child: const Center(
      child: Text(
        "R",
        style: TextStyle(
          fontSize: 72,
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
  );
}
