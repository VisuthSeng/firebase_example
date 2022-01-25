import 'package:firebase_example/data/model/product_model.dart';
import 'package:firebase_example/presentation/controller/product_controller.dart';
import 'package:firebase_example/presentation/screen/widget/textbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({Key? key}) : super(key: key);

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final ProductController productController = Get.find();
  late TextEditingController tecname;
  late TextEditingController tecprice;
  late FocusNode fnName;
  late FocusNode fnPrice;
  @override
  void initState() {
    tecname = TextEditingController();
    tecprice = TextEditingController();
    fnName = FocusNode();
    fnPrice = FocusNode();
    tecname.text = productController.selectedProduct.name;
    tecprice.text = productController.selectedProduct.price.toString();

    super.initState();
  }

  @override
  void dispose() {
    tecname.dispose();
    tecprice.dispose();
    fnName.dispose();
    fnPrice.dispose();
    super.dispose();
  }

  save(ProductModel model) {
    productController.saveDate(model);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add product'),
      ),
      body: Column(
        children: [
          TextBox(
            hinttext: "Name",
            controller: tecname,
            focusNode: fnName,
          ),
          TextBox(
            hinttext: "Price",
            controller: tecprice,
          ),
          ElevatedButton(
            onPressed: () {
              var id = productController.selectedProduct.id;
              var price = double.tryParse(tecprice.text) ?? 0;
              var model = ProductModel(
                id: id,
                name: tecname.text,
                price: price,
              );
              save(model);
            },
            child: const Text('Save'),
          )
        ],
      ),
    );
  }
}
