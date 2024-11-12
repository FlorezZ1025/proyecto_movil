
abstract class UserDatasource {
  Future<void> saveUserData(String email, String password, String name,
      String lastName, String phone, String cc);
}
