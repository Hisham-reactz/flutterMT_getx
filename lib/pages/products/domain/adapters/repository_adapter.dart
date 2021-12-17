// ignore: one_member_abstracts

abstract class IProductRepository {
  Future<List> getProducts([params]);
}

abstract class ICategoryRepository {
  Future<List> getCategories();
  Future<List> getsubCategories(id);
}
