import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_demo/pages/products/domain/adapters/repository_adapter.dart';
import 'package:get_demo/pages/products/domain/entity/product/product.dart';
import 'package:get_demo/pages/products/presentation/controllers/product_controller.dart';
import 'package:matcher/matcher.dart' as m;

class MockRepository implements IProductRepository {
  @override
  Future<List<Product>> getProducts([params]) async {
    await Future.delayed(Duration(milliseconds: 100));

    if (Random().nextBool()) {
      return [Product()];
    }

    return Future<List<Product>>.error('error');
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => HttpOverrides.global = null);
  final binding = BindingsBuilder(() {
    Get.lazyPut<IProductRepository>(() => MockRepository());
    Get.lazyPut<ProductController>(
      () => ProductController(
        productRepository: Get.find(),
      ),
    );
  });

  test('Test Binding', () {
    expect(Get.isPrepared<ProductController>(), false);
    expect(Get.isPrepared<IProductRepository>(), false);

    /// test you Binding class with BindingsBuilder
    binding.builder();

    expect(Get.isPrepared<ProductController>(), true);
    expect(Get.isPrepared<IProductRepository>(), true);

    Get.reset();
  });
  test('Test Controller', () async {
    /// Controller can't be on memory
    expect(
        () => Get.find<ProductController>(), throwsA(m.TypeMatcher<String>()));

    /// build Binding
    binding.builder();

    /// recover your controller
    final controller = Get.find<ProductController>();

    /// check if onInit was called
    expect(controller.initialized, true);

    /// check initial Status
    expect(controller.status.isLoading, true);

    /// await time request
    await Future.delayed(Duration(milliseconds: 100));

    if (controller.status.isError) {
      expect(controller.state, null);
    }

    if (controller.status.isSuccess) {
      expect(controller.state!.first.id, 1);
      expect(controller.state!.first.name, '');
    }
  });

  test('ever', () async {
    final count = ''.obs;
    var result = '';
    ever<String>(count, (value) {
      result = value;
    });
    count.value = '1';
    expect('1', result);
  });
}

class Controller extends GetxController {
  final count = 0.obs;
  void increment() => count.value++;

  @override
  void onInit() {
    print('inittt');
    super.onInit();
  }

  @override
  void onReady() {
    print('onReady');
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    print('onClose');
  }
}
