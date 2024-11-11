import 'package:rappi_u/models/shop.dart';

abstract class ShopDatasource {
  Future<List<Shop>> fetchShops();
}
