import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';

import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/dashboard/presentation/bloc/dashboard_bloc.dart';
import '../features/splash/presentation/bloc/splash_bloc.dart';
import '../features/companies/presentation/bloc/companies_bloc.dart';
import '../core/network/api_client.dart';
import '../features/companies/data/datasources/companies_local_datasource.dart';
import '../features/companies/data/datasources/companies_remote_datasource.dart';
import '../features/companies/data/repositories/companies_repository_impl.dart';

import 'routes/app_pages.dart';

class AuraCRMApp extends StatelessWidget {
  const AuraCRMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [

        /// SPLASH
        BlocProvider<SplashBloc>(
          create: (_) => SplashBloc()..add(StartSplashEvent()),
        ),

        /// AUTH
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(),
        ),

        /// DASHBOARD
        BlocProvider<DashboardBloc>(
          create: (_) => DashboardBloc(),
        ),

        /// COMPANIES
        BlocProvider<CompaniesBloc>(
          create: (_) => CompaniesBloc(
            repository: CompaniesRepositoryImpl(
              remoteDataSource: CompaniesRemoteDataSourceImpl(
                apiClient: ApiClient(),
              ),
              localDataSource: CompaniesLocalDataSourceImpl(),
            ),
          )..add(LoadCompaniesEvent()),
        ),

      ],

      child: MaterialApp.router(

        debugShowCheckedModeBanner: false,

        title: 'Aura CRM',

        theme: ThemeData(
          useMaterial3: true,

          scaffoldBackgroundColor: AppColors.background,

          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryContainer,
          ),
        ),

        routerConfig: AppPages.router,
      ),
    );
  }
}