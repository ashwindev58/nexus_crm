
import 'package:flutter/material.dart';

import '../../../data/models/company_model.dart';

class CompanyMetaData extends StatelessWidget {
  const CompanyMetaData({
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
              const Icon(
                Icons.location_on_outlined,
                size: 15,
                color: Colors.black38,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  '${company.address.city} • ${company.address.street}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(
                Icons.access_time_outlined,
                size: 15,
                color: Colors.black38,
              ),
              const SizedBox(width: 6),
              Text(
                'Last active ${company.lastActive}',
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
