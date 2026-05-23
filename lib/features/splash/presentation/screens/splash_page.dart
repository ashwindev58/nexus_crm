import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_name.dart';
import '../../../../core/widgets/custom_logo.dart';
import '../../../../core/widgets/loader_widget.dart';
import '../../../../core/widgets/language_selector.dart';
import '../../../../core/widgets/env_badge.dart';
import '../../../../core/localization/app_localizations.dart';
import '../bloc/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    
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
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        EnvBadge(),
                        LanguageSelector(),
                      ],
                    ),
                    const Spacer(),
  
                    /// Logo
                    const CustomLogo(),
  
                    const SizedBox(height: 28),
  
                    /// Title
                    const AppName(),
  
                    const SizedBox(height: 12),
  
                    /// Subtitle
                    Text(
                      localizations.translate('unlockingPotential'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 17,
                        height: 1.5,
                        color: AppColors.textMuted,
                      ),
                    ),
  
                    const Spacer(),
  
                    /// Progress
                    LoaderWidget(msgLoading: localizations.translate('welcomeToCRM')),
  
                    const SizedBox(height: 60),
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
