import 'package:firebase_example/presentation/controller/product_controller.dart';
import 'package:get/instance_manager.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController(), permanent: true);
  }
}
