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
