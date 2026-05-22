import 'package:flutter/material.dart';
import '../../data/models/company_model.dart';
import 'company_status_badge.dart';

class CompanyCardDetails extends StatelessWidget {
  final CompanyModel company;

  const CompanyCardDetails({
    super.key,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  company.company.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1B1B1B),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              CompanyStatusBadge(status: company.status),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            company.email,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            company.phone,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
