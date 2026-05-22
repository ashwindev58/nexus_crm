import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {

  SplashBloc() : super(const SplashState()) {

    on<StartSplashEvent>(_onStartSplash);
  }

  Future<void> _onStartSplash(
    StartSplashEvent event,
    Emitter<SplashState> emit,
  ) async {

    await Future.delayed(
      const Duration(seconds: 3),
    );

    emit(
      state.copyWith(
        navigateToLogin: true,
      ),
    );
  }
}