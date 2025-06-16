import '../../../data/services/bybit_service.dart';
import '../../../data/services/auth_service.dart';

final bybitService = BybitService();

class DashboardModel {
  final AuthService authService;

  DashboardModel({required this.authService});

  Future<String> get walletBalance async {
    final walletData = await bybitService.getWalletBalance();
    final totalWalletBalance = walletData['totalWalletBalance'];
    return totalWalletBalance;
  }

  Future<void> logout() async {
    await authService.logout();
  }
}