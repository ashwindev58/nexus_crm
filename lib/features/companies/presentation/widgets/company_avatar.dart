import 'package:flutter/material.dart';
import '../../data/models/company_model.dart';

class CompanyAvatar extends StatelessWidget {
  final CompanyModel company;

  const CompanyAvatar({
    super.key,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: company.themeColor,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        company.initials,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
