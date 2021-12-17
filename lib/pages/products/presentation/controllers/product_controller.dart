import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_demo/pages/products/domain/adapters/repository_adapter.dart';

class ProductController extends SuperController<List> {
  ProductController({required this.productRepository});
  final IProductRepository productRepository;
  final _page = 0.obs;
  int? catId;
  int? subcatId;
  ScrollController sctrl = ScrollController();

  @override
  void onInit() {
    super.onInit();
    //Loading, Success, Error handle with 1 line of code
    append(() => productRepository.getProducts);

    //scroll pagination
    sctrl.addListener(() {
      if (sctrl.position.atEdge) {
        if (sctrl.position.pixels == 0) {
          // You're at the top.
          pageSet(true);
        } else {
          // You're at the bottom.
          pageSet(false);
        }
      }
    });
  }

  //url params get
  String getParams() {
    Map<String, dynamic> params = {
      'store_id': '2',
      'limit': '20',
      'sort_by': 'sale_price',
      'sort_type': 'DESC',
      'offset': _page,
      'parent_category_id': catId,
      'category_id': subcatId,
    };
    String paramString = '';
    params.forEach((k, v) {
      if (v != null) paramString = paramString + '$k=$v&';
    });
    return paramString;
  }

  //page set
  void pageSet(top) {
    if (top && _page.value > 0 || !top) {
      top ? _page.value-- : _page.value++;
      getProducts();
    }
  }

  //get products
  void getProducts([bool? sub, int? cat]) {
    if (cat != null) {
      sub! ? subcatId = cat : catId = cat;
      _page.value = 0;
    }
    change(value, status: RxStatus.loading());
    fetchProducts(
      getParams(),
    ).then((value) {
      change(value, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(state, status: RxStatus.error(error.toString()));
    });
  }

  //products api service
  Future<List> fetchProducts(params) async {
    final products = await productRepository.getProducts(params);
    return products;
  }

  //mandatory lifecycle methods of SuperController don't delete.

  @override
  void onDetached() {
    // print('onDetached called');
  }

  @override
  void onInactive() {
    // print('onInative called');
  }

  @override
  void onPaused() {
    // print('onPaused called');
  }

  @override
  void onResumed() {
    // print('onResumed called');
  }

  @override
  void dispose() {
    super.dispose();
  }
}
