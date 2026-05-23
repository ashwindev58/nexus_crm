import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nexus_crm/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:nexus_crm/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:nexus_crm/features/companies/presentation/bloc/companies_bloc.dart';
import 'package:nexus_crm/features/companies/data/repositories/companies_repository_impl.dart';
import 'package:nexus_crm/features/companies/data/datasources/companies_local_datasource.dart';
import 'package:nexus_crm/features/companies/data/datasources/companies_remote_datasource.dart';
import 'package:nexus_crm/core/network/api_client.dart';
import 'package:nexus_crm/core/widgets/shimmer_effect.dart';
import 'package:nexus_crm/core/localization/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nexus_crm/core/localization/locale_bloc.dart';
import 'package:nexus_crm/core/config/env_config.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    EnvConfig.initialize(AppEnvironment.dev);
  });

  Widget createDashboardScreen() {
    final companiesRepo = CompaniesRepositoryImpl(
      remoteDataSource: CompaniesRemoteDataSourceImpl(apiClient: ApiClient()),
      localDataSource: CompaniesLocalDataSourceImpl(),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<LocaleBloc>(create: (_) => LocaleBloc()),
        BlocProvider<CompaniesBloc>(create: (_) => CompaniesBloc(repository: companiesRepo)),
        BlocProvider<DashboardBloc>(create: (_) => DashboardBloc()),
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
            home: const DashboardPage(),
          );
        },
      ),
    );
  }

  testWidgets('DashboardPage loading state renders skeletons, then stats render test', (WidgetTester tester) async {
    // Build our DashboardPage and trigger a frame.
    await tester.pumpWidget(createDashboardScreen());
    await tester.pump(const Duration(milliseconds: 100)); // Pump a short duration to let initial BLoC events trigger

    // Initially, it should be in loading state, rendering ShimmerEffect widgets from DashboardSkeleton
    expect(find.byType(ShimmerEffect), findsAtLeastNWidgets(4));

    // Wait for the simulated API delay (1 second) to complete
    await tester.pump(const Duration(seconds: 2));

    // Verify skeleton loaders are gone and stat metrics are displayed
    expect(find.text('CRM Dashboard'), findsOneWidget);
    
    // Check key mock stat values
    expect(find.text('Active Clients'), findsOneWidget);
    expect(find.text('Pending Tasks'), findsOneWidget);
  });
}
