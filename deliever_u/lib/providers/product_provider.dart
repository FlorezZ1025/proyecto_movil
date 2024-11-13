import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rappi_u/datasources/supabase_product_datasource.dart';
import 'package:rappi_u/models/product.dart';
import 'package:rappi_u/repositories/product_repository.dart';

final productDatasourceProvider = Provider((ref) {
  return SupabaseProductDatasource();
});

final productRepositoryProvider = Provider((ref) {
  final productDatasource = ref.read(productDatasourceProvider);
  return ProductRepository(productDatasource);
});

final productProvider =
    FutureProvider.family<List<Product>, String>((ref, idShop) async {
  final productRepository = ref.read(productRepositoryProvider);
  final products =
      await productRepository.getProductsByShopId(int.parse(idShop));
  return products;
});
