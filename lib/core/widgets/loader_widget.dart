import 'dart:ui';

import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  final double size;
  final String msgLoading;

  const LoaderWidget({
    super.key,
    this.size = 24,
    required this.msgLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            minHeight: 6,
            backgroundColor: Colors.deepPurple.withValues(alpha: .08),
            valueColor: const AlwaysStoppedAnimation(Color(0xFF4F46E5)),
          ),
        ),

        const SizedBox(height: 28),

        /// Glass Loader Card
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .45),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withValues(alpha: .3)),
              ),
              child: Text(
                msgLoading,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withValues(alpha: .6),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
