import 'dart:async';

class AuthService {
  final List<Map<String, String>> _users = [];

  Future<String?> login(String email, String password) async {
    final user = _users.firstWhere(
      (user) => user['email'] == email && user['password'] == password,
      orElse: () => {},
    );

    if (user.isNotEmpty) {
      return "Login exitoso";
    } else {
      return "Correo o contraseña incorrectos";
    }
  }

  Future<String?> register(String email, String password) async {
    final existingUser = _users.firstWhere(
      (user) => user['email'] == email,
      orElse: () => {},
    );

    if (existingUser.isNotEmpty) {
      return "Este correo ya está en uso";
    } else {
      _users.add({
        'email': email,
        'password': password,
      });
      return "Registro exitoso";
    }
  }
}
