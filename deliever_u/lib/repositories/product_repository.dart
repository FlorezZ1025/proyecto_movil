
import 'package:rappi_u/datasources/product_datasource.dart';
import 'package:rappi_u/models/product.dart';

class ProductRepository {
  final ProductDatasource productDatasource;

  ProductRepository(this.productDatasource);

  Future<List<Product>> getProductsByShopId(int shopId) async {
    return productDatasource.getProductsByShopId(shopId);
  }
}