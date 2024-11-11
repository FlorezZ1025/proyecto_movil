import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDatasource {
  Future<User?> login(String email, String password);
  Future<User?> register(String email, String password, String name,
      String lastName, String phone, String cc);
  Stream<User?> getUserSesion();
  Future<void> logout();
}
