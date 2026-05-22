import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';
import 'package:nexus_crm/features/companies/data/models/company_model.dart';

class CompanyDetailsInfoCards extends StatelessWidget {
  final CompanyModel company;

  const CompanyDetailsInfoCards({super.key, required this.company});

  String _getIndustry(String bs) {
    final lowerBs = bs.toLowerCase();
    if (lowerBs.contains('tech') || lowerBs.contains('software') || lowerBs.contains('web') || lowerBs.contains('harness') || lowerBs.contains('matrix')) {
      return 'Software & Tech';
    }
    if (lowerBs.contains('e-enable') || lowerBs.contains('synergize') || lowerBs.contains('delivery')) {
      return 'Logistics & Supply';
    }
    return 'Professional Services';
  }

  @override
  Widget build(BuildContext context) {
    final industry = _getIndustry(company.company.bs);
    final formattedId = '#ND-88${company.id.toString().padLeft(2, '0')}';

    return Column(
      children: [
        // Contact details
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.015),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildContactItem(
                icon: Icons.alternate_email,
                title: 'Email',
                value: company.email.toLowerCase(),
              ),
              const Divider(color: AppColors.divider, height: 24, thickness: 1),
              _buildContactItem(
                icon: Icons.phone_outlined,
                title: 'Phone',
                value: company.phone,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Website & Industry Grid Row
        Row(
          children: [
            Expanded(
              child: _buildGridCard(
                icon: Icons.language,
                title: 'Website',
                value: company.website.toLowerCase(),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildGridCard(
                icon: Icons.category_outlined,
                title: 'Industry',
                value: industry,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Address Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.015),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: _buildContactItem(
            icon: Icons.location_on_outlined,
            title: 'Address',
            value: '${company.address.street}, ${company.address.suite}, ${company.address.city}',
          ),
        ),
        const SizedBox(height: 16),
        // Company ID Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.015),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Company ID',
                    style: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formattedId,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.copy_all, color: AppColors.primaryContainer, size: 20),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: formattedId));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Copied ID $formattedId to clipboard!'),
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.containerSoftIndigo,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.primaryContainer, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGridCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.015),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.containerSoftIndigo,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.primaryContainer, size: 16),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
