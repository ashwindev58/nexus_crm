part of 'auth_bloc.dart';

class AuthState {
  final bool isLoading;
  final bool isSuccess;
  final bool isPasswordVisible;
  final String? message;
  final bool isFailure; 

  const AuthState({
    this.isLoading = false,
    this.isSuccess = false,
    this.isPasswordVisible = false,
    this.message,
    this.isFailure = false,
  });

  AuthState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isPasswordVisible,
    String? message,
    bool? isFailure,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isPasswordVisible:
          isPasswordVisible ?? this.isPasswordVisible,
      message: message ?? this.message,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}