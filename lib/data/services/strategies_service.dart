import 'package:client/data/models/strategies_dtos.dart';

import '../services/api_client.dart';

class StrategiesService {
  Future<List<StrategyDto>> getStrategiesList() async {
    final response = await api.get('/strategies/list');
    final data = response.data as List;
    return data.map((json) => StrategyDto.fromJson(json)).toList();
  }
}