
import 'package:go_router/go_router.dart';


import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/splash/presentation/screens/splash_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import 'route_name.dart';

class AppPages {
  static final router = GoRouter(
    initialLocation: RouteNames.splash,
    routes: [

      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashPage(),
      ),

      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginPage(),
      ),

      GoRoute(
        path: RouteNames.dashboard,
        builder: (context, state) => const DashboardPage(),
      ),

      // GoRoute(
      //   path: RouteNames.companies,
      //   builder: (context, state) => const CompaniesPage(),
      // ),
    ],
  );
}