import 'package:get/get.dart';
import 'package:get_demo/pages/products/domain/adapters/repository_adapter.dart';
import 'package:get_demo/pages/products/presentation/controllers/product_controller.dart';

class CategoryController extends SuperController<List> {
  CategoryController({required this.catRepository});
  final ICategoryRepository catRepository;
  int? selectCatId;
  int? selectSubcatId;
  List subCats = [];

  @override
  void onInit() {
    super.onInit();
    //Loading, Success, Error handle with 1 line of code
    append(() => catRepository.getCategories);
  }

  //get subcats
  void getSubcats() {
    change(value, status: RxStatus.loading());
    fetchSubcats().then((value) {
      subCats = value;
      change(state, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(value, status: RxStatus.error(error.toString()));
    });
  }

  //update products
  void getProducts(bool sub, int cat) {
    Get.find<ProductController>().getProducts(sub, cat);
  }

  //set category
  setCat(bool sub, int catID) {
    if (sub) {
      selectSubcatId = catID;
      getProducts(true, catID);
    } else {
      selectCatId = catID;
      getSubcats();
      getProducts(false, catID);
    }
    update();
  }

  //subcats api service
  Future<List> fetchSubcats() async {
    final products = await catRepository.getsubCategories(
      selectCatId,
    );
    return products;
  }

  //mandatory lifecycle methods of SuperController don't delete.

  @override
  void onDetached() {
    print('onDetached called');
  }

  @override
  void onInactive() {
    print('onInative called');
  }

  @override
  void onPaused() {
    print('onPaused called');
  }

  @override
  void onResumed() {
    print('onResumed called');
  }

  @override
  void dispose() {
    super.dispose();
  }
}
