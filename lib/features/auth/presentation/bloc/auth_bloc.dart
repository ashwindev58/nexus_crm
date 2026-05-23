import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
  }

  void _onTogglePasswordVisibility(
    TogglePasswordVisibility event,
    Emitter<AuthState> emit,
  ) {
    emit(AuthState(
      isPasswordVisible: !state.isPasswordVisible,
      isLoading: false,
      isSuccess: false,
      isFailure: false,
      message: null,
    ));
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthState(
      isLoading: true,
      isPasswordVisible: state.isPasswordVisible,
      isSuccess: false,
      isFailure: false,
      message: null,
    ));

    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (event.email == 'test@gmail.com' && event.password == '12345678') {
      emit(AuthState(
        isLoading: false,
        isSuccess: true,
        isPasswordVisible: state.isPasswordVisible,
        message: "Login Successful",
        isFailure: false,
      ));
    } else {
      emit(AuthState(
        isLoading: false,
        isSuccess: false,
        isPasswordVisible: state.isPasswordVisible,
        message: "Invalid email or password",
        isFailure: true,
      ));
    }
  }
}