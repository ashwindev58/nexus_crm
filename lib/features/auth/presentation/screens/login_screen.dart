import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FF),

      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.isSuccess) {

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Login Success'),
                ),
              );

              context.go('/dashboard');
            }
          },

          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 40),

                const LoginHeader(),

                const SizedBox(height: 40),

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
    );
  }
}