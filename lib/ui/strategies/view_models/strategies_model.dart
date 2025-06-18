import '../../../data/services/strategies_service.dart';
import '../../../data/services/auth_service.dart';

final strategiesService = StrategiesService();

class StrategiesModel {
  final AuthService authService;

  StrategiesModel({required this.authService});

  Future<Map<String, dynamic>> get strategies async {
    final strategies = await strategiesService.getStrategiesList();
    return strategies;
  }
}