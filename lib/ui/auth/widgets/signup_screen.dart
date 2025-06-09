import 'package:flutter/material.dart';
import '../view_models/signup_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordCopyController = TextEditingController();
  final _publicKeyController = TextEditingController();
  final _privateKeyController = TextEditingController();

  Future<void> _handleSignup() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    final passwordCopy = _passwordCopyController.text.trim();
    final publicKey = _publicKeyController.text.trim();
    final privateKey = _privateKeyController.text.trim();
    await signup(username, publicKey,privateKey, password);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordCopyController.dispose();
    _publicKeyController.dispose();
    _privateKeyController.dispose();
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
                    'Добро пожаловать!',
                    style: Theme.of(context).textTheme.headlineMedium,
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
                    controller: _publicKeyController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: 'Публичный ключ',
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
                    controller: _privateKeyController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: 'Приватный ключ',
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
                  SizedBox(height: 22),
                  TextFormField(
                    controller: _passwordCopyController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: 'Повтор пароля',
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
                    onPressed: _handleSignup,// TODO: add SignUp logic
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xFF4285f4),
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 71),
                    ),
                    child: Text(
                      'Регистрация',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
