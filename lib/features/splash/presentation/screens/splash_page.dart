import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/app_name.dart';
import '../../../../core/widgets/custom_logo.dart';
import '../../../../core/widgets/loader_widget.dart';
import '../bloc/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listenWhen: (previous, current) =>
            current.navigateToLogin && !previous.navigateToLogin,
        listener: (context, state) {
          context.go('/login');
        },
        child: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            debugPrint(state.toString());
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const Spacer(),
  
                    /// Logo
                    customLogo(),
  
                    const SizedBox(height: 28),
  
                    /// Title
                    appName(),
  
                    const SizedBox(height: 12),
  
                    /// Subtitle
                    const Text(
                      "Manage Companies & Business Growth",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        height: 1.5,
                        color: Color(0xFF464555),
                      ),
                    ),
  
                    const Spacer(),
  
                    /// Progress
                    loaderWidget(),
  
                    SizedBox(height: 60),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
