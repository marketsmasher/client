import '../../../data/services/auth_service.dart';
import '../../../data/models/auth_dtos.dart';

final authService = AuthService();

Future<void> signup(String username, String publicKey, String privateKey, String password) async {
  final dto = SignupDto(username: username, publicKey: publicKey, privateKey: privateKey, password: password);
  await authService.signup(dto);
}