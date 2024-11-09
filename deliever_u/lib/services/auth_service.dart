// import 'package:supabase_flutter/supabase_flutter.dart';

// class AuthService {
//   final SupabaseClient supabase = Supabase.instance.client;

//   Future<void> signUp(String UserEmail, String UserPassword) async {
//     final response = await supabase.auth.signUp(
//       email: UserEmail,
//       password: UserPassword,
//     );

//     if (response.user == null) {
//       throw Exception('Sign up failed');
//     }
//   }

//   Future<void> login(String email, String password) async {
//     final response = await supabase.auth.signInWithPassword(
//       email: email,
//       password: password,
//     );

//     if (response.session == null) {
//       throw Exception('Sign in failed');
//     }
//   }

//   Future<void> signOut() async {
//     await supabase.auth.signOut();
//   }
// }
