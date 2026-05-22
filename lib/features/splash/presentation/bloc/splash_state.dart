part of 'splash_bloc.dart';

class SplashState {
  final bool navigateToLogin;

  const SplashState({
    this.navigateToLogin = false,
  });

  SplashState copyWith({
    bool? navigateToLogin,
  }) {
    return SplashState(
      navigateToLogin:
          navigateToLogin ?? this.navigateToLogin,
    );
  }
}