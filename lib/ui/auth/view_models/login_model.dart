import '../../../data/services/auth_service.dart';
import '../../../data/models/auth_dtos.dart';

class LoginModel {
  final AuthService authService;

  LoginModel({required this.authService});

  Future<void> login(String username, String password) async {
    final dto = LoginDto(username: username, password: password);
    await authService.login(dto);
  }
}