import 'package:get/get.dart';
import 'package:get_demo/pages/products/domain/entity/product/category.dart';

// ignore: one_member_abstracts
abstract class ICategoryProvider {
  Future<Response> getCats(String path);
  Future<Response> getSubcats(String path);
}

class CategoryProvider extends GetConnect implements ICategoryProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => val.map((d) => Category.fromJson(d as Map<String, dynamic>));
    httpClient.baseUrl = 'https://sta.farawlah.sa/api/mobile';
  }

  @override
  Future<Response> getCats(String path) => get(path);
  Future<Response> getSubcats(String path) => get(path);
}
