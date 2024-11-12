import 'package:rappi_u/models/product.dart';

abstract class ProductDatasource {

  Future<List<Product>> getProductsByShopId(int shopId);
}