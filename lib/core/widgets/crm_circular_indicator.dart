import 'package:flutter/material.dart';

Widget crmCircularProgressIndicator({required Color color}) {
  return SizedBox(
    width: 24,
    height: 24,
    child: CircularProgressIndicator(color: color, strokeWidth: 2),
  );
}
