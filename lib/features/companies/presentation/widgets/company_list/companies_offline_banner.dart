import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';
import '../../bloc/companies_bloc.dart';

class CompaniesOfflineBanner extends StatelessWidget {
  const CompaniesOfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompaniesBloc, CompaniesState>(
      buildWhen: (previous, current) => previous.isOffline != current.isOffline,
      builder: (context, state) {
        if (!state.isOffline) return const SizedBox.shrink();

        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.backgroundLightIndigo, // soft slate/light indigo background
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.borderLightLavender, // soft lavender/indigo border
            ),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.cloud_off_rounded,
                color: AppColors.primaryContainer, // Indigo icon
                size: 18,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'You are viewing offline cached data.',
                  style: TextStyle(
                    color: AppColors.textDarkIndigo, // dark indigo text
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
