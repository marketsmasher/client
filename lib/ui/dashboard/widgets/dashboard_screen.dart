import 'package:flutter/material.dart';
import '../view_models/dashboard_model.dart';
import 'package:provider/provider.dart';
import '../../../data/services/auth_service.dart';
import '../../core/ui/navigation_widget.dart';

class DashboardScreenWrapper extends StatelessWidget {
  const DashboardScreenWrapper({super.key});
  @override
  Widget build(BuildContext context) {
    return Provider<DashboardModel>(
      create: (_) => DashboardModel(authService: context.read<AuthService>()),
      child: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Future<void> _handleLogout() async {
    final model = context.read<DashboardModel>();
    await model.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navigation(),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: Column(
              children: [
                SizedBox(
                  width: 224,
                  height: 120,
                  child: Card.filled(
                    color: Color(0xFF1C1C1C),
                    child: FutureBuilder<String>(
                      future: context.read<DashboardModel>().walletBalance,
                      builder: (context, asyncSnapshot) {
                        final balance = double.tryParse(asyncSnapshot.data ?? '')?.toStringAsFixed(2) ?? '0.00';
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Баланс',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600)
                              ),
                              SizedBox(height: 8),
                              Text(
                                '\$ $balance',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card.filled(
                      color: Color(0xFF1C1C1C),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                      )
                  ),
                ),
                FilledButton(
                  onPressed: _handleLogout,
                  style: FilledButton.styleFrom(
                    backgroundColor: Color(0xFF4285f4),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 71),
                  ),
                  child: Text(
                    'Выход',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
