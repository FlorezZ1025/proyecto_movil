import 'package:rappi_u/datasources/user_datasource.dart';
import 'package:rappi_u/models/save_user_params.dart';

class UserRepository {
  final UserDatasource userDatasource;

  UserRepository(this.userDatasource);

  Future<void> saveUserInSupabase(SaveUserParams saveUserParams) async {
    return userDatasource.saveUserData(
        saveUserParams.email,
        saveUserParams.password,
        saveUserParams.name,
        saveUserParams.lastName,
        saveUserParams.phone,
        saveUserParams.cc);
  }
}