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
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (event.email == 'test@gmail.com' && event.password == '12345678') {
      emit(state.copyWith(isLoading: false, isSuccess: true, message: "Login Successful", isFailure: false));
    } else {
      emit(state.copyWith(isLoading: false, isSuccess: false, message: "Invalid email or password", isFailure: true ));
    }
  }
}