import 'package:firebase_example/data/datasource/product_datasource.dart';
import 'package:firebase_example/data/domain/repository/category_item_interface_repository.dart';

import 'package:firebase_example/data/domain/usecase/category_item_usecase.dart';
import 'package:firebase_example/data/repository/product_repository.dart';

import 'package:firebase_example/presentation/controller/product_controller.dart';
import 'package:get/instance_manager.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IProductDataSource?>(
      ProductDataSource(),
      permanent: true,
    );
    Get.put<IProductRepository?>(
      ProductRepository(iProductDataSource: Get.find()),
      permanent: true,
    );
    Get.put<GetAllProductUseCase?>(
      GetAllProductUseCase(
        iProductRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<AddProductUseCase?>(
      AddProductUseCase(
        iProductRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<UpdateProductUseCase?>(
      UpdateProductUseCase(
        iProductRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<DeleteProductUseCase?>(
      DeleteProductUseCase(
        iProductRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put(
      ProductController(
        getAllProductUseCase: Get.find(),
      ),
      permanent: true,
    );
  }
}
