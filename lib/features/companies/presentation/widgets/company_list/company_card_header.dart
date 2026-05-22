
import 'package:flutter/material.dart';

import '../../../data/models/company_model.dart';
import '../shared/company_status_badge.dart';

class CompanyCardHeader extends StatelessWidget {
  const CompanyCardHeader({
    super.key,
    required this.company,
  });

  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                company.company.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1B1B1B),
                ),
              ),
              const SizedBox(width: 8),
              CompanyStatusBadge(status: company.status),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            company.email,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            company.phone,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
