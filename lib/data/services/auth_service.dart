import 'package:client/data/models/auth_dtos.dart';
import 'package:flutter/material.dart';
import '../services/api_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService extends ChangeNotifier {
  final storage = FlutterSecureStorage();
  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  AuthService() {
    _init();
  }

  Future<void> _init() async {
    _loggedIn = await isLoggedIn;
    notifyListeners();
  }

  Future<String> login(LoginDto dto) async {
    final response = await api.post('/auth', data: dto.toJson());
    final token = response.data['token'];
    await storage.write(key: 'token', value: token);

    _loggedIn = true;
    notifyListeners();
    return token;
  }

  Future<void> logout() async {
    await storage.delete(key: 'token');
    _loggedIn = false;
    notifyListeners();
  }

  Future<String?> getToken() async => await storage.read(key: 'token');

  Future<bool> get isLoggedIn async {
    final token = await getToken();

    return token?.isNotEmpty ?? false;
  }

  Future<void> signup(SignupDto dto) async {
    await api.post('/users/add', data: dto.toJson());
  }
}