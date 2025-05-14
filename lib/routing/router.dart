import 'package:client/ui/main.dart';
import 'package:go_router/go_router.dart';
import '../ui/auth/widgets/login_screen.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
  ],
);
