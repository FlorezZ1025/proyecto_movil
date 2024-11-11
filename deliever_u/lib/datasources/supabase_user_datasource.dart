import 'package:rappi_u/datasources/user_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseUserDatasource extends UserDatasource {
  @override
  Future<void> saveUserData(String email, String password, String name,
      String lastName, String phone, String cc) async {
    try {
      final supabaseClient = Supabase.instance.client;
      final response = await supabaseClient.from('users').insert({
        'email': email,
        'password': password,
        'first_name': name,
        'last_name': lastName,
        'phone_number': phone,
        'cc': cc
      });
    } catch (e) {
      print(e);

    }
  }
}
