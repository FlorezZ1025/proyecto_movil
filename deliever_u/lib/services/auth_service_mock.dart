import 'dart:async';

class AuthService {
  // Simulamos una base de datos de usuarios
  final List<Map<String, String>> _users = [];

  // Función para iniciar sesión
  Future<String?> login(String email, String password) async {
    // Buscar si el usuario existe en la lista
    final user = _users.firstWhere(
      (user) => user['email'] == email && user['password'] == password,
      orElse: () => {},
    );

    if (user.isNotEmpty) {
      // Si el usuario existe y la contraseña coincide
      return "Login exitoso";
    } else {
      // Si no existe o la contraseña es incorrecta
      return "Correo o contraseña incorrectos";
    }
  }

  // Función para registrar un nuevo usuario
  Future<String?> register(String email, String password) async {
    // Verificar si el correo ya está en uso
    final existingUser = _users.firstWhere(
      (user) => user['email'] == email,
      orElse: () => {},
    );

    if (existingUser.isNotEmpty) {
      // Si el usuario ya existe
      return "Este correo ya está en uso";
    } else {
      // Si el correo no está en uso, crear el usuario
      _users.add({
        'email': email,
        'password': password,
      });
      return "Registro exitoso";
    }
  }
}
