import 'package:client/data/models/strategies_dtos.dart';

import '../../../data/services/strategies_service.dart';
import '../../../data/services/auth_service.dart';

final strategiesService = StrategiesService();

class StrategiesModel {
  final AuthService authService;

  StrategiesModel({required this.authService});

  Future<List<StrategyDto>> get strategies async {
    final strategies = await strategiesService.getStrategiesList();
    return strategies;
  }
}