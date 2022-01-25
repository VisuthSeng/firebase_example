import 'package:firebase_example/presentation/controller/product_controller.dart';
import 'package:firebase_example/presentation/screen/product/add_product.dart';
import 'package:firebase_example/presentation/screen/product/edit_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  final ProductController productController = Get.find();
  ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const AddProduct());
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: productController.listProduct
                .map(
                  (x) => GestureDetector(
                    onTap: () {
                      productController.selectProduct(x);
                      Get.to(() => const EditProduct());
                    },
                    child: Card(
                      child: Container(
                        color: Colors.grey,
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              x.name + '  ' + x.price.toString(),
                            ),
                            IconButton(
                              onPressed: () =>
                                  productController.deleteData(x.id),
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
