import '../../../data/services/auth_service.dart';
import '../../../data/models/auth_dtos.dart';

class SignupModel {
  final AuthService authService;

  SignupModel({required this.authService});

  Future<void> signup(String username, String publicKey, String privateKey, String password) async {
    final dto = SignupDto(username: username, publicKey: publicKey, privateKey: privateKey, password: password);
    await authService.signup(dto);
  }
}