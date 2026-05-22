import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import 'login_button.dart';
import 'login_email_input.dart';
import 'login_password_input.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        debugPrint('Rebuilding LoginForm with state: ${state.message}');
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginEmailInput(emailController: emailController),
              const SizedBox(height: 20),
              LoginPasswordInput(
                passwordController: passwordController,
                isPasswordVisible: state.isPasswordVisible,
              ),
              const SizedBox(height: 32),
              LoginButton(
                formKey: formKey,
                emailController: emailController,
                passwordController: passwordController,
                isLoading: state.isLoading,
              ),
            ],
          ),
        );
      },
    );
  }
}
