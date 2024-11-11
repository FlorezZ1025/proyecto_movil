import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rappi_u/datasources/supabase_shop_datasource.dart';
import 'package:rappi_u/models/shop.dart';
import 'package:rappi_u/repositories/shop_repository.dart';

final shopDatasourceProvider = Provider((ref) {
  return SupabaseShopDatasource();
});

final shopRepositoryProvider = Provider((ref) {
  final shopDatasource = ref.read(shopDatasourceProvider);
  return ShopRepository(shopDatasource);
});

final shopProvider = FutureProvider<List<Shop>>((ref) async {
  final shopRepository = ref.read(shopRepositoryProvider);
  return shopRepository.fetchShops();
});
