import 'package:rappi_u/datasources/shop_datasource.dart';
import 'package:rappi_u/models/shop.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseShopDatasource extends ShopDatasource {
  @override
  Future<List<Shop>> fetchShops() async {
    try {
      final supabaseClient = Supabase.instance.client;
      final response = await supabaseClient
          .from('shops')
          .select('name, description, image_url');
      return (response)
          .map((e) => Shop.fromMap(e))
          .toList();
    } catch (e) {
      print(e);
    }
    return [];
  }
}
