import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_text_field.dart';
import '../bloc/auth_bloc.dart';

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
        if (state.isFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message ?? 'Login Failed'),
                backgroundColor: Colors.red,
              ),
            );
          });
        }
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// EMAIL
              const Text(
                'Email Address',
                style: TextStyle(
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
                    return 'Please enter your email address';
                  }
                  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value.trim())) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              /// PASSWORD
              const Text(
                'Password',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              CustomTextField(
                controller: passwordController,
                hintText: '••••••••',

                obscureText: !state.isPasswordVisible,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  icon: Icon(
                    state.isPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    context.read<AuthBloc>().add(TogglePasswordVisibility());
                  },
                ),
              ),

              const SizedBox(height: 32),

              /// LOGIN BUTTON
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: state.isLoading
                      ? null
                      : () {
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Submitting login request...'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                            context.read<AuthBloc>().add(
                                  LoginSubmitted(
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                  ),
                                );
                          } 
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F46E5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: state.isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
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
