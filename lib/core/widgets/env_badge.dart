import 'package:flutter/material.dart';
import '../config/env_config.dart';

class EnvBadge extends StatelessWidget {
  const EnvBadge({super.key});

  @override
  Widget build(BuildContext context) {
    EnvConfig config;
    try {
      config = EnvConfig.instance;
    } catch (_) {
      // Return shrinked widget if EnvConfig has not been initialized (e.g. in tests)
      return const SizedBox.shrink();
    }

    if (!config.showDebugBadge) {
      return const SizedBox.shrink();
    }

    final isDev = config.environment == AppEnvironment.dev;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isDev ? Colors.indigo.shade50 : Colors.amber.shade50,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isDev ? Colors.indigo.shade200 : Colors.amber.shade300,
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: isDev ? Colors.indigo.shade600 : Colors.amber.shade700,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            isDev ? 'DEV' : 'STAGING',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w900,
              color: isDev ? Colors.indigo.shade800 : Colors.amber.shade900,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
