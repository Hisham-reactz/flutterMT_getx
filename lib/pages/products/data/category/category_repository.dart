import 'package:get_demo/pages/products/data/category/category_api_provider.dart';
import 'package:get_demo/pages/products/domain/adapters/repository_adapter.dart';

class CategoryRepository implements ICategoryRepository {
  CategoryRepository({required this.provider});
  final ICategoryProvider provider;

  @override
  Future<List> getCategories() async {
    final cats = await provider.getCats(
      "/categories",
    );
    if (cats.status.hasError) {
      return Future.error(cats.statusText!);
    } else {
      return cats.body!.toList();
    }
  }

  @override
  Future<List> getsubCategories(id) async {
    final subcats = await provider.getCats(
      "/subcategories?parent_id=$id",
    );
    if (subcats.status.hasError) {
      return Future.error(subcats.statusText!);
    } else {
      return subcats.body!.toList();
    }
  }
}
