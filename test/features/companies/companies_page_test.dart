import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nexus_crm/features/companies/presentation/bloc/companies_bloc.dart';
import 'package:nexus_crm/features/companies/presentation/screens/company_list_screen.dart';
import 'package:nexus_crm/features/companies/presentation/widgets/company_list/company_card_skeleton.dart';
import 'package:nexus_crm/features/companies/presentation/widgets/company_list/companies_segmented_control.dart';
import 'package:nexus_crm/features/companies/data/repositories/companies_repository_impl.dart';
import 'package:nexus_crm/features/companies/data/datasources/companies_local_datasource.dart';
import 'package:nexus_crm/features/companies/data/datasources/companies_remote_datasource.dart';
import 'package:nexus_crm/core/network/api_client.dart';
import 'package:nexus_crm/core/localization/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nexus_crm/core/localization/locale_bloc.dart';
import 'package:nexus_crm/core/config/env_config.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    EnvConfig.initialize(AppEnvironment.dev);
  });

  Widget createCompanyListScreen() {
    final companiesRepo = CompaniesRepositoryImpl(
      remoteDataSource: CompaniesRemoteDataSourceImpl(apiClient: ApiClient()),
      localDataSource: CompaniesLocalDataSourceImpl(),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<LocaleBloc>(create: (_) => LocaleBloc()),
        BlocProvider<CompaniesBloc>(create: (_) => CompaniesBloc(repository: companiesRepo)),
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
            home: const CompanyListScreen(),
          );
        },
      ),
    );
  }

  testWidgets('CompanyListScreen renders skeletons and list view elements test', (WidgetTester tester) async {
    // Build our CompanyListScreen and trigger a frame.
    await tester.pumpWidget(createCompanyListScreen());
    await tester.pump(const Duration(milliseconds: 100)); // Pump to register BLoC initialization

    // Skeletons should be visible while loading
    expect(find.byType(CompanyListSkeleton), findsOneWidget);

    // Let the bloc complete its async fetches
    await tester.pump(const Duration(seconds: 2));

    // Verify search bar and filter segmented control are visible
    expect(find.byType(CompaniesSegmentedControl), findsOneWidget);
    expect(find.text('Companies'), findsOneWidget);
  });
}
