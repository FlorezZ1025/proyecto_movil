import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rappi_u/datasources/supabase_user_datasource.dart';
import 'package:rappi_u/repositories/user_repository.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final userDatasource = SupabaseUserDatasource();
  final userRepository = UserRepository(userDatasource);
  return userRepository;
});
