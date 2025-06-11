import 'package:client/ui/main.dart';
import 'package:go_router/go_router.dart';

import '../ui/auth/widgets/login_screen.dart';
import 'package:client/ui/auth/widgets/signup_screen.dart';
import '../ui/dashboard/widgets/dashboard_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignupScreen(),
    ),
  ],
);
