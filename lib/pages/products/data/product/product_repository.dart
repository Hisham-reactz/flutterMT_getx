import 'package:get_demo/pages/products/data/product/product_api_provider.dart';
import 'package:get_demo/pages/products/domain/adapters/repository_adapter.dart';

class ProductRepository implements IProductRepository {
  ProductRepository({required this.provider});
  final IProductProvider provider;

  @override
  Future<List> getProducts([
    param = 'store_id=2&offset=0&limit=20&sort_by=sale_price&sort_type=DESC',
  ]) async {
    print('/products?$param');
    final products = await provider.getProducts(
      '/products?$param',
    );
    if (products.status.hasError) {
      return Future.error(products.statusText!);
    } else {
      if (products.body == null) {
        return Future.error(products.statusText!);
      }
      return products.body!.toList();
    }
  }
}
