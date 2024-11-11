import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDatasource {
  Future<User?> login(String email, String password);
  Stream<User?> getUserSesion();
  Future<void> logout();
}
