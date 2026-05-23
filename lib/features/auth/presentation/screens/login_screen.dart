import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/env_badge.dart';
import '../../../../core/widgets/language_selector.dart';
import '../../../../core/localization/app_localizations.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.isSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(localizations.translate('loginSuccess')),
                ),
              );
              context.go('/dashboard');
            }
            if (state.isFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(localizations.translate('loginFailed')),
                  backgroundColor: AppColors.error,
                ),
              );
            }
          },
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSizes.xl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        EnvBadge(),
                        LanguageSelector(),
                      ],
                    ),
                    const SizedBox(height: AppSizes.huge),
                    const LoginHeader(),
                    const SizedBox(height: AppSizes.huge),
                    LoginForm(
                      formKey: _formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}