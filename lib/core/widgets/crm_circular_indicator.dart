import 'package:flutter/material.dart';

class CRMCircularProgressIndicator extends StatelessWidget {
  final Color color;

  const CRMCircularProgressIndicator({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(color: color, strokeWidth: 2),
    );
  }
}
