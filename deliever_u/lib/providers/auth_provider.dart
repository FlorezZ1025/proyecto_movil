import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rappi_u/datasources/firebase_auth_service_datasource.dart';
import 'package:rappi_u/models/sign_in_params.dart';
import 'package:rappi_u/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final firebaseAuthServiceDatasource = FirebaseAuthServiceDatasource();
  final authRepository = AuthRepository(firebaseAuthServiceDatasource);
  return authRepository;
});

final loginFutureProvider = FutureProvider.family<bool, SignInParams>((ref, credentials) async {
  final authRepository = ref.watch(authRepositoryProvider);
  return await authRepository.login(credentials);
});