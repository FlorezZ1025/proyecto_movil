import 'package:rappi_u/datasources/shop_datasource.dart';
import 'package:rappi_u/models/shop.dart';

class ShopRepository {
  final ShopDatasource shopDatasource;

  ShopRepository(this.shopDatasource);

  Future<List<Shop>> fetchShops() async {
    return shopDatasource.fetchShops();
  }
}