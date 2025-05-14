import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// TODO: move Form and Button styles to Theme
class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: Column(
              children: [
                SizedBox(height: 80),
                Text(
                  'С возвращением!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 67),
                TextFormField(
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
                  onPressed: () {}, // TODO: add login logic
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
