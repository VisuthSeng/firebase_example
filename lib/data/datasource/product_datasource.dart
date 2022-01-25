// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_example/data/model/product_model.dart';
import 'package:firebase_example/presentation/controller/product_controller.dart';
import 'package:get/get.dart';

abstract class IProductDataSource {
  Future<int> createProduct(ProductModel model);
  Future<int> updateProduct(ProductModel model);
  Future<int> deleteProduct(int recordId);
  Future<List<ProductModel>> readProduct();
}

class ProductDataSource extends IProductDataSource {
  @override
  Future<int> createProduct(ProductModel model) async {
    final ProductController productController = Get.find();
    var id = await FirebaseFirestore.instance
        .collection('product')
        .doc(model.id)
        .set(
          model.toMap(),
        )
        .then(
      (value) {
        productController.listProduct.add(model);
      },
    ).catchError((onError) {
      return;
    });
    return id;
  }

  @override
  Future<int> updateProduct(ProductModel model) async {
    final ProductController productController = Get.find();
    var id = await FirebaseFirestore.instance
        .collection('product')
        .doc(model.id)
        .set(
          model.toMap(),
        )
        .then(
      (value) {
        productController.listProduct.add(model);
      },
    ).catchError(
      (onError) {
        return;
      },
    );
    return id;
  }

  @override
  Future<List<ProductModel>> readProduct() async {
    // final ProductController productController = Get.find();
    List<ProductModel> list = [];

    await FirebaseFirestore.instance.collection('product').get().then(
      (QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          list.add(ProductModel.fromFirestore(doc));
        }
      },
    );

    return list;
  }

  @override
  Future<int> deleteProduct(int recordId) async {
    final ProductController productController = Get.find();
    var id = FirebaseFirestore.instance
        .collection('product')
        .doc(productController.selectedProduct.id)
        .delete()
        .then((value) {
      productController.listProduct
          .removeWhere((x) => x.id == productController.selectedProduct.id);
    }).catchError(
      (onError) {
        return;
      },
    );
    return recordId;
  }
}
