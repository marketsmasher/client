import 'package:client/data/services/auth_service.dart';
import 'package:client/ui/strategies/widgets/strategies_screen.dart';
import 'package:go_router/go_router.dart';

import '../ui/auth/widgets/login_screen.dart';
import 'package:client/ui/auth/widgets/signup_screen.dart';
import '../ui/dashboard/widgets/dashboard_screen.dart';

GoRouter createRouter(AuthService authService) {
  return GoRouter(
    refreshListenable: authService,
    redirect: (context, state) {
      final loggedIn = authService.loggedIn;
      final goingToLoginLocations = ['/', '/signup'];
      final goingToLogin = goingToLoginLocations.contains(state.matchedLocation);
      if (!loggedIn && !goingToLogin) return '/';
      if (goingToLogin && loggedIn) return '/dashboard';
      return null;
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => LoginScreenWrapper()),
      GoRoute(path: '/signup', builder: (context, state) => SignupScreenWrapper()),
      GoRoute(path: '/dashboard', builder: (context, state) => DashboardScreenWrapper()),
      GoRoute(path: '/strategies', builder: (context, state) => StrategiesScreenWrapper()),
    ],
  );
}