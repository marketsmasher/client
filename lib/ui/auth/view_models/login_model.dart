import '../../../data/services/auth_service.dart';
import '../../../data/models/auth_dtos.dart';

final authService = AuthService();

Future<void> login(String username, String password) async {
  final dto = LoginDto(username: username, password: password);
  await authService.login(dto);
}