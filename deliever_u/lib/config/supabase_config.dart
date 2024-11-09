import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String supabaseUrl = '';
  static const String supabaseKey = '';

  static Future<void> init() async {
    await Supabase.initialize(
      url: supabaseUrl ,
      anonKey: supabaseKey
          ,
    );
  }
}
