interface class LoginDto {
  final String username;
  final String password;

  const LoginDto({required this.username, required this.password});

  factory LoginDto.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'username': String username, 'password': String password} => LoginDto(
        username: username,
        password: password,
      ),
      _ => throw const FormatException('Failed to send login data.'),
    };
  }

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}

interface class SignupDto {
  final String username;
  final String publicKey;
  final String privateKey;
  final String password;

  const SignupDto({required this.username, required this.publicKey, required this.privateKey, required this.password});

  factory SignupDto.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'username': String username, 'publicKey': String publicKey, 'privateKey': String privateKey, 'password': String password} => SignupDto(
        username: username,
        publicKey: publicKey,
        privateKey: privateKey,
        password: password,
      ),
      _ => throw const FormatException('Failed to send signup data.'),
    };
  }

  Map<String, dynamic> toJson() {
    return {'username': username, 'publicKey': publicKey, 'privateKey': privateKey, 'password': password};
  }
}