import 'package:rappi_u/datasources/product_datasource.dart';
import 'package:rappi_u/models/product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseProductDatasource extends ProductDatasource {
  @override
  Future<List<Product>> getProductsByShopId(int shopId) async {
    try {
      final supabaseClient = Supabase.instance.client;
      final response = await supabaseClient
          .from('products')
          .select('id_product, name, image, price, id_shop')
          .eq('id_shop', shopId.toString());

      return (response).map((e) => Product.fromMap(e)).toList();
    } catch (e) {
      print(e);
    }
    return [];
  }
}
