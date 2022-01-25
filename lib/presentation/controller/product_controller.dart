import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_example/data/domain/entity/no_param.dart';
import 'package:firebase_example/data/domain/usecase/category_item_usecase.dart';
import 'package:firebase_example/data/model/product_model.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController {
  var listProduct = RxList<ProductModel>();
  final GetAllProductUseCase? getAllProductUseCase;

  var selectedProduct = ProductModel(id: '', name: '', price: 0);

  ProductController({this.getAllProductUseCase});

  // loadProduct() async {
  //   listProduct.clear();
  //   await FirebaseFirestore.instance
  //       .collection('product')
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     for (var doc in querySnapshot.docs) {
  //       listProduct.add(ProductModel.fromFirestore(doc));
  //     }
  //   });
  // }

  selectProduct(ProductModel model) async {
    selectedProduct = model;
  }

  loadProduct() async {
    var list = await getAllProductUseCase!.call(NoParam());
    listProduct.assignAll(list);
  }

  saveDate(ProductModel model) async {
    await FirebaseFirestore.instance
        .collection('product')
        .doc(model.id)
        .set(
          model.toMap(),
        )
        .then(
      (value) {
        listProduct.add(model);
      },
    ).catchError(
      (onError) {
        return;
      },
    );
  }

  deleteData(String id) async {
    FirebaseFirestore.instance
        .collection('product')
        .doc(id)
        .delete()
        .then((value) {
      listProduct.removeWhere((x) => x.id == id);
    }).catchError((onError) {
      return;
    });
  }
}
