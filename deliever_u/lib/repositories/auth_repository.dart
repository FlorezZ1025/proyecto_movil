import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rappi_u/datasources/auth_datasource.dart';
import 'package:rappi_u/models/save_user_params.dart';
import 'package:rappi_u/models/sign_in_params.dart';

class AuthRepository {
  final AuthDatasource authDatasource;

  AuthRepository(this.authDatasource);

  Future<User?> login(SignInParams signInParams) {
    return authDatasource.login(signInParams.email, signInParams.password);
  }

  Future<User?> register(SaveUserParams saveUserParams) {
    return authDatasource.register(
        saveUserParams.email,
        saveUserParams.password,
        saveUserParams.name,
        saveUserParams.lastName,
        saveUserParams.phone,
        saveUserParams.cc
        );
  }

  Stream<User?> get loginStateChanges => authDatasource.getUserSesion();

  Future<void> signOut() {
    return authDatasource.logout();
  }
}
