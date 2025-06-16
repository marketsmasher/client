import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../data/services/auth_service.dart';
import '../view_models/login_model.dart';

class LoginScreenWrapper extends StatelessWidget {
  const LoginScreenWrapper({super.key});
  @override
  Widget build(BuildContext context) {
    return Provider<LoginModel>(
      create: (_) => LoginModel(authService: context.read<AuthService>()),
      child: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _handleLogin() async {
    final model = context.read<LoginModel>();
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    await model.login(username, password);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

// TODO: move Form and Button styles to Theme
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: Form(
              child: Column(
                children: [
                  SizedBox(height: 80),
                  Text(
                    'С возвращением!',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 67),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'Логин',
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 29,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: 'Пароль',
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 29,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 44),
                  FilledButton(
                    onPressed: _handleLogin,
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xFF4285f4),
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 71),
                    ),
                    child: Text(
                        'Вход',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Spacer(),
                  RichText(
                    text: TextSpan(
                      text: 'Впервые с нами? ',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                        ),
                      children: [
                        TextSpan(
                            text: 'Регистрация',
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                            ..onTap = () => context.go('/signup')
                        ),
                      ]
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
