import 'package:get/get.dart';
import 'package:get_demo/pages/products/data/category/category_api_provider.dart';
import 'package:get_demo/pages/products/data/category/category_repository.dart';
import 'package:get_demo/pages/products/data/product/product_api_provider.dart';
import 'package:get_demo/pages/products/data/product/product_repository.dart';
import 'package:get_demo/pages/products/domain/adapters/repository_adapter.dart';
import 'package:get_demo/pages/products/presentation/controllers/category_controller.dart';
import 'package:get_demo/pages/products/presentation/controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IProductProvider>(
      () => ProductProvider(),
    );
    Get.lazyPut<IProductRepository>(
      () => ProductRepository(
        provider: Get.find(),
      ),
    );
    Get.lazyPut(
      () => ProductController(
        productRepository: Get.find(),
      ),
    );
    Get.lazyPut<ICategoryProvider>(
      () => CategoryProvider(),
    );
    Get.lazyPut<ICategoryRepository>(
      () => CategoryRepository(
        provider: Get.find(),
      ),
    );
    Get.lazyPut(
      () => CategoryController(
        catRepository: Get.find(),
      ),
    );
  }
}
