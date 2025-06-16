import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/services/auth_service.dart';
import '../routing/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService(),
      builder: (context, _) {
        final authService = context.watch<AuthService>();
        final router = createRouter(authService);

        return MaterialApp.router(
          routerConfig: router,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
            ),
          ),
        );
      },
    );
  }
}