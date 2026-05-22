import 'package:flutter/material.dart';

Widget tittileWidget({required String text}) {
  return  Text(
    text,
    style: TextStyle(
      color: Color(0xFF4F46E5), // Violet blue color matching mockup
      fontWeight: FontWeight.w700,
      fontSize: 20,
      letterSpacing: 0.3,
      height: 1.4,
    ),
  );
}
