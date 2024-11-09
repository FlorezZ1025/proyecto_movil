import 'package:rappi_u/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/auth_service_mock.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _message;

  void _register() async {
    final email = _emailController.text;
    final name = _nameController.text;
    final phone = _phoneController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty || name.isEmpty || phone.isEmpty) {
      setState(() {
        _message = "Todos los campos son requeridos";
      });
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        _message = "Las contraseñas no coinciden";
      });
      return;
    }

    final result = await _authService.register(email, password);

    setState(() {
      _message = result;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            constraints: const BoxConstraints(maxWidth: 400,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  icon:Icon(Icons.email, color: AppColors.red,),
                  floatingLabelStyle: TextStyle(color: AppColors.red),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red)
                  )),
        
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  icon: Icon(Icons.person, color: AppColors.red,),
                  floatingLabelStyle: TextStyle(color: AppColors.red),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red)
                  )),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Celular',
                  icon: Icon(Icons.phone_iphone_rounded, color: AppColors.red,),
                  floatingLabelStyle: TextStyle(color: AppColors.red),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red)
                  )),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  icon: Icon(Icons.lock, color: AppColors.red,),
                  floatingLabelStyle: TextStyle(color: AppColors.red),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red)
                  )),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirmar contraseña',
                  icon: Icon(Icons.password_sharp, color: AppColors.red,),
                  floatingLabelStyle: TextStyle(color: AppColors.red),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red)
                  )),
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
                onPressed: _register,
                child: const Text('Registrarse', style: TextStyle(color: AppColors.black)),
              ),
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('¿Ya tienes cuenta? Inicia Sesión', style: TextStyle(color: AppColors.black)),
              ),
            ],
          ),
        ),
      ),
    ));
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

}
