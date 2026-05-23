import 'package:flutter/material.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../data/models/company_model.dart';
import '../widgets/company_details/company_details_screen_appbar.dart';
import '../widgets/company_details/mobile_stack_layout.dart';
import '../widgets/company_details/tab_stack_layout_widget.dart';

class CompanyDetailsScreen extends StatelessWidget {
  final CompanyModel company;

  const CompanyDetailsScreen({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSlate,
      appBar: CompanyDetailScreenAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 720) {
            return TabStackLayoutWidget(company: company);
          }

          // Default Mobile Stack Layout
          return MobileStackLayOut(company: company);
        },
      ),
    );
  }
}
