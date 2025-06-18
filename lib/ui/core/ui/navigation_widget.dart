import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    return NavigationBar(
      selectedIndex: _getSelectedIndex(location),
      onDestinationSelected: (index) => _onItemTapped(index, context),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Dashboard',
        ),
        NavigationDestination(
          icon: Icon(Icons.candlestick_chart),
          label: 'Strategies',
        ),
      ],
    );
  }

  int _getSelectedIndex(String location) {
    if (location.startsWith('/dashboard')) return 0;
    if (location.startsWith('/strategies')) return 1;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/dashboard');
        break;
      case 1:
        context.go('/strategies');
        break;
    }
  }
}