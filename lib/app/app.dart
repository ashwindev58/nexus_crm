import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/dashboard/presentation/bloc/dashboard_bloc.dart';
import '../features/splash/presentation/bloc/splash_bloc.dart';
import '../features/companies/presentation/bloc/companies_bloc.dart';

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
          create: (_) => CompaniesBloc()..add(LoadCompaniesEvent()),
        ),

      ],

      child: MaterialApp.router(

        debugShowCheckedModeBanner: false,

        title: 'Aura CRM',

        theme: ThemeData(
          useMaterial3: true,

          scaffoldBackgroundColor:
              const Color(0xFFF8F9FF),

          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF4F46E5),
          ),
        ),

        routerConfig: AppPages.router,
      ),
    );
  }
}