import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/localization/app_localizations.dart';
import '../bloc/auth_bloc.dart';

class LoginPasswordInput extends StatelessWidget {
  final TextEditingController passwordController;
  final bool isPasswordVisible;

  const LoginPasswordInput({
    super.key,
    required this.passwordController,
    required this.isPasswordVisible,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.translate('password'),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: passwordController,
          hintText: '••••••••',
          obscureText: !isPasswordVisible,
          textInputAction: TextInputAction.done,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return localizations.translate('passwordRequired');
            }
            if (value.length < 6) {
              return localizations.translate('passwordTooShort');
            }
            return null;
          },
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: AppColors.textSecondary,
            ),
            onPressed: () {
              context.read<AuthBloc>().add(TogglePasswordVisibility());
            },
          ),
        ),
      ],
    );
  }
}
