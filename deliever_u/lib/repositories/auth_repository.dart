import 'package:rappi_u/datasources/auth_datasource.dart';
import 'package:rappi_u/datasources/firebase_auth_service_datasource.dart';
import 'package:rappi_u/models/sign_in_params.dart';

class AuthRepository {
  final AuthDatasource authDatasource;

  AuthRepository(this.authDatasource);

  Future<bool> login(SignInParams signInParams) {
    return authDatasource.login(signInParams.email, signInParams.password);
  }

}
