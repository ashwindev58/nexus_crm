import 'package:flutter/material.dart';

class CompanyDetailsActions extends StatelessWidget {
  const CompanyDetailsActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildQuickAction(Icons.phone, 'Call', () {}),
        const SizedBox(width: 28),
        _buildQuickAction(Icons.email, 'Email', () {}),
        const SizedBox(width: 28),
        _buildQuickAction(Icons.chat_bubble, 'Message', () {}),
      ],
    );
  }

  Widget _buildQuickAction(IconData icon, String label, VoidCallback onTap) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xFF4F46E5),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF4F46E5),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
