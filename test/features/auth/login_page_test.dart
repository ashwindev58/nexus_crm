import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nexus_crm/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nexus_crm/features/auth/presentation/screens/login_screen.dart';
import 'package:nexus_crm/core/localization/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nexus_crm/core/localization/locale_bloc.dart';
import 'package:nexus_crm/core/config/env_config.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    EnvConfig.initialize(AppEnvironment.dev);
  });

  Widget createLoginScreen() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocaleBloc>(create: (_) => LocaleBloc()),
        BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
      ],
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, localeState) {
          return MaterialApp(
            locale: localeState.locale,
            localizationsDelegates: const [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''),
              Locale('ml', ''),
            ],
            home: const LoginPage(),
          );
        },
      ),
    );
  }

  testWidgets('LoginPage validation fields and toggle visbility tests', (WidgetTester tester) async {
    await tester.pumpWidget(createLoginScreen());
    await tester.pumpAndSettle();

    // Verify initial state: Email input and Password input should be visible
    expect(find.byType(TextField), findsNWidgets(2)); // Email and Password inputs

    // Find submit button
    final loginButtonFinder = find.byType(ElevatedButton);
    expect(loginButtonFinder, findsOneWidget);

    // Scroll to the button to make sure it's fully visible and hit-testable
    await tester.ensureVisible(loginButtonFinder);
    await tester.pumpAndSettle();

    await tester.tap(loginButtonFinder);
    await tester.pumpAndSettle();

    // Verify validation error messages are displayed
    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);

    // Find password suffix icon and tap it to toggle visibility
    final visibilityIconFinder = find.byIcon(Icons.visibility_off_outlined);
    expect(visibilityIconFinder, findsOneWidget);

    await tester.tap(visibilityIconFinder);
    await tester.pumpAndSettle();

    // After toggle, it should change to visibility_outlined icon
    expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);
  });
}
