import 'package:get/get.dart';
import 'package:get_demo/pages/products/bindings/product_binding.dart';
import 'package:get_demo/pages/products/presentation/views/products_view.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static final routes = [
    GetPage(
      name: Routes.PRODUCTS,
      page: () => ProductsView(),
      binding: ProductBinding(),
    ),
  ];
}
