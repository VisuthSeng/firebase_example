import 'package:firebase_example/data/datasource/product_datasource.dart';
import 'package:firebase_example/data/domain/repository/category_item_interface_repository.dart';
import 'package:firebase_example/data/model/product_model.dart';

class ProductRepository extends IProductRepository {
  final IProductDataSource? iProductDataSource;

  ProductRepository({this.iProductDataSource});

  @override
  Future<List<ProductModel>> getAllProduct() async {
    List<ProductModel> listCategory = await iProductDataSource!.readProduct();
    return listCategory;
  }

  @override
  Future<int> addProduct(ProductModel model) {
    var id = iProductDataSource!.createProduct(model);
    return id;
  }

  @override
  Future<int> deleteProduct(int recordId) async {
    var id = await iProductDataSource!.deleteProduct(recordId);
    return id;
  }

  @override
  Future<int> updateProduct(ProductModel model) async {
    var id = await iProductDataSource!.updateProduct(model);
    return id;
  }
}
