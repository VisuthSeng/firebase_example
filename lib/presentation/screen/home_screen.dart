import 'package:firebase_example/presentation/controller/product_controller.dart';
import 'package:firebase_example/presentation/screen/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final ProductController productController = Get.find();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          productController.loadProduct();
          Get.to(() => ProductScreen());
        },
        child: const Text('Product'),
      )),
    );
  }
}
