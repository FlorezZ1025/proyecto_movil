import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rappi_u/controllers/login_controller.dart';
import 'package:rappi_u/providers/auth_validator_provider.dart';
import 'package:rappi_u/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ccController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();

  String? _message;
  @override
  Widget build(BuildContext context) {
    final emailValidator = ref.read(emailValidatorProvider);
    final passwordValidator = ref.read(passwordValidatorProvider);
    final nameValidator = ref.read(nameValidatorProvider);
    final numberValidator = ref.read(numberValidatorProvider);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: const Center(child: Text('Registro')),
        ),
        backgroundColor: AppColors.tertiaryColor,
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              child: Form(
                key: _registerKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      validator: emailValidator,
                      controller: _emailController,
                      decoration: const InputDecoration(
                          labelText: 'Correo electrónico',
                          icon: Icon(
                            Icons.email,
                            color: AppColors.red,
                          ),
                          floatingLabelStyle: TextStyle(color: AppColors.red),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.red))),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      validator: nameValidator,
                      controller: _nameController,
                      decoration: const InputDecoration(
                          labelText: 'Nombre',
                          icon: Icon(
                            Icons.person,
                            color: AppColors.red,
                          ),
                          floatingLabelStyle: TextStyle(color: AppColors.red),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.red))),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      validator: nameValidator,
                      controller: _lastNameController,
                      decoration: const InputDecoration(
                          labelText: 'Apellido',
                          icon: Icon(
                            Icons.person,
                            color: AppColors.red,
                          ),
                          floatingLabelStyle: TextStyle(color: AppColors.red),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.red))),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      validator: numberValidator,
                      controller: _ccController,
                      decoration: const InputDecoration(
                          labelText: 'CC',
                          icon: Icon(
                            Icons.person,
                            color: AppColors.red,
                          ),
                          floatingLabelStyle: TextStyle(color: AppColors.red),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.red))),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      validator: numberValidator,
                      controller: _phoneController,
                      decoration: const InputDecoration(
                          labelText: 'Celular',
                          icon: Icon(
                            Icons.phone_iphone_rounded,
                            color: AppColors.red,
                          ),
                          floatingLabelStyle: TextStyle(color: AppColors.red),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.red))),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      validator: passwordValidator,
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          labelText: 'Contraseña',
                          icon: Icon(
                            Icons.lock,
                            color: AppColors.red,
                          ),
                          floatingLabelStyle: TextStyle(color: AppColors.red),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.red))),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      validator: (value){
                        if(value != _passwordController.text){
                          return 'Las contraseñas no coinciden';
                        }
                        return null;
                      },
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(
                          labelText: 'Confirmar contraseña',
                          icon: Icon(
                            Icons.password_sharp,
                            color: AppColors.red,
                          ),
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
                        if(_registerKey.currentState?.validate() ?? false){
                          //Registrar
                          ref.read(signInControllerProvider.notifier).register(
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                            _nameController.text.trim(),
                            _lastNameController.text.trim(),
                            _phoneController.text.trim(),
                            _ccController.text.trim()
                          );
                          context.go('/auth');
                        }
                      },
                      child: const Text('Registrarse',
                          style: TextStyle(color: AppColors.black)),
                    ),
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text('¿Ya tienes cuenta? Inicia Sesión',
                          style: TextStyle(color: AppColors.black)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
