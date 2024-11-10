import 'package:flutter/material.dart';
import 'package:rappi_u/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/auth_service_mock.dart';
import 'package:go_router/go_router.dart';

import '../utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _message;

  void _signInWithEmail() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _message = "Todos los campos son requeridos";
      });
      return;
    }
    try{
        final AuthResponse response = await supabase.auth.signInWithPassword(email: email, password: password);
        final Session? session = response.session;
        final User? user = response.user;
    //TODO crear el provider
    }catch(e){
      setState(() {
        _message = "Error al iniciar sesión";
      });
    }


 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Center(child:Text('Login')),
      ),
      backgroundColor: AppColors.tertiaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
        
               Image.asset(
                'assets/images/logoRappiU.jpg', 
                height: 250, 
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  floatingLabelStyle: TextStyle(color: AppColors.red),
                  icon: Icon(Icons.email, color: AppColors.red),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red),
                  ))),
              
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  icon: Icon(Icons.lock, color: AppColors.red),
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
                // onPressed: _login,
                onPressed:() =>{
                  context.go('/home')
                  },
                child:const Text('Iniciar Sesión', style: TextStyle(color: AppColors.black),),
              ),
              TextButton(
                onPressed: () {
                    setState(() {
                    _message = '';
                  });
                  context.push('/register');
                },
                child: const Text('¿No tienes cuenta? Regístrate', style: TextStyle(color: AppColors.black),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
