// ignore_for_file: file_names

import 'package:firebase_example/data/model/product_model.dart';
import 'package:firebase_example/presentation/screen/product/item/add_product.dart';

abstract class IProductRepository {
  Future<List<ProductModel>> getAllProduct();
  Future<int> addProduct(ProductModel model);
  Future<int> updateProduct(ProductModel model);
  Future<int> deleteProduct(int recordId);
}
// a