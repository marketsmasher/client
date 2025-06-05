import 'package:client/data/models/auth_dtos.dart';
import '../services/api_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final storage = FlutterSecureStorage();

  Future<String> login(LoginDto dto) async {
    final response = await api.post('/auth', data: dto.toJson());
    final token = response.data['token'];
    await storage.write(key: 'token', value: token);

    return token;
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }
}
