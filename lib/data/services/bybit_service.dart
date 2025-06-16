import '../services/api_client.dart';

class BybitService {
  Future<Map<String, dynamic>> getWalletBalance() async {
    final response = await api.get('/bybit/account/wallet-balance');
    final responseResult = response.data['result']['list'][0];
    return responseResult;
  }
}