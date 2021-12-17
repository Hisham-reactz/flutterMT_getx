import 'package:get/get.dart';
import 'package:get_demo/pages/products/domain/entity/product/product.dart';

// ignore: one_member_abstracts
abstract class IProductProvider {
  Future<Response> getProducts(String path);
}

class ProductProvider extends GetConnect implements IProductProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => val.map((d) => Product.fromJson(d as Map<String, dynamic>));
    httpClient.baseUrl = 'https://sta.farawlah.sa/api/mobile';
  }

  @override
  Future<Response> getProducts(String path) => get(path);
}
