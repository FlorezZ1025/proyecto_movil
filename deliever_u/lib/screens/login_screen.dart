import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rappi_u/controllers/login_controller.dart';
import '../providers/auth_validator_provider.dart';
import 'package:go_router/go_router.dart';

import '../utils/colors.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> _signInKey = GlobalKey<FormState>();

  String? _message;


  @override
  Widget build(BuildContext context) {
    final emailValidator = ref.read(emailValidatorProvider);
    final passwordValidator = ref.read(passwordValidatorProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Login')),
      ),
      backgroundColor: AppColors.tertiaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _signInKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logoRappiU.jpg',
                  height: 250,
                ),
                const SizedBox(height: 30),
                TextFormField(
                    controller: emailController,
                    validator: emailValidator,
                    decoration: const InputDecoration(
                        labelText: 'Correo electrónico',
                        floatingLabelStyle: TextStyle(color: AppColors.red),
                        icon: Icon(Icons.email, color: AppColors.red),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.red),
                        ))),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  validator: passwordValidator,
                  decoration: const InputDecoration(
                      labelText: 'Contraseña',
                      icon: Icon(Icons.lock, color: AppColors.red),
                      floatingLabelStyle: TextStyle(color: AppColors.red),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.red))),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                if (_message != null)
                  Text(
                    _message!,
                    style: const TextStyle(color: Colors.red),
                  ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_signInKey.currentState?.validate() ?? false) {
                      ref
                          .read(signInControllerProvider.notifier)
                          .login(emailController.text, passwordController.text);
                      context.go('/auth');
                    }
                  },
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(color: AppColors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _message = '';
                    });
                    context.push('/auth/register');
                  },
                  child: const Text(
                    '¿No tienes cuenta? Regístrate',
                    style: TextStyle(color: AppColors.black),
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
