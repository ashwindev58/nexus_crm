import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Events
abstract class LocaleEvent {}

class LoadLocaleEvent extends LocaleEvent {}

class ChangeLocaleEvent extends LocaleEvent {
  final Locale locale;
  ChangeLocaleEvent(this.locale);
}

// States
class LocaleState {
  final Locale locale;
  const LocaleState(this.locale);
}

// BLoC
class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  static const String _localeLangKey = 'SELECTED_LANGUAGE_CODE';

  LocaleBloc() : super(const LocaleState(Locale('en'))) {
    on<LoadLocaleEvent>(_onLoadLocale);
    on<ChangeLocaleEvent>(_onChangeLocale);
    add(LoadLocaleEvent());
  }

  Future<void> _onLoadLocale(LoadLocaleEvent event, Emitter<LocaleState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final langCode = prefs.getString(_localeLangKey);
      if (langCode != null) {
        emit(LocaleState(Locale(langCode)));
      }
    } catch (_) {}
  }

  Future<void> _onChangeLocale(ChangeLocaleEvent event, Emitter<LocaleState> emit) async {
    emit(LocaleState(event.locale));
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_localeLangKey, event.locale.languageCode);
    } catch (_) {}
  }
}
