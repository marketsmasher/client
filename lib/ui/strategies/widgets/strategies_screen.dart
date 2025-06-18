import 'package:client/ui/core/ui/navigation_widget.dart';
import 'package:flutter/material.dart';
import '../view_models/strategies_model.dart';
import 'package:provider/provider.dart';
import '../../../data/services/auth_service.dart';

class StrategiesScreenWrapper extends StatelessWidget {
  const StrategiesScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<StrategiesModel>(
      create: (_) => StrategiesModel(authService: context.read<AuthService>()),
      child: const StrategiesScreen(),
    );
  }
}

class StrategiesScreen extends StatefulWidget {
  const StrategiesScreen({super.key});

  @override
  State<StrategiesScreen> createState() => _StrategiesScreenState();
}

class _StrategiesScreenState extends State<StrategiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navigation(),
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 33)),
      ),
    );
  }
}
