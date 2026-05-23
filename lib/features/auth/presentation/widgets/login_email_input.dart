import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/localization/app_localizations.dart';

class LoginEmailInput extends StatelessWidget {
  final TextEditingController emailController;

  const LoginEmailInput({
    super.key,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.translate('emailAddress'),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: emailController,
          hintText: 'name@company.com',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return localizations.translate('emailRequired');
            }
            final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
            if (!emailRegex.hasMatch(value.trim())) {
              return localizations.translate('invalidEmail');
            }
            return null;
          },
        ),
      ],
    );
  }
}
