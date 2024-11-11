import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rappi_u/datasources/firebase_auth_service_datasource.dart';
import 'package:rappi_u/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final firebaseAuthServiceDatasource = FirebaseAuthServiceDatasource();
  final authRepository = AuthRepository(firebaseAuthServiceDatasource);
  return authRepository;
});

final loginStreamStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authRepositoryProvider).loginStateChanges;
});
