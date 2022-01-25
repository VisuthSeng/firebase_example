import 'package:firebase_example/data/domain/entity/no_param.dart';
import 'package:firebase_example/data/domain/repository/category_item_interface_repository.dart';
import 'package:firebase_example/data/domain/usecase/usecase.dart';
import 'package:firebase_example/data/model/product_model.dart';

class GetAllProductUseCase extends UseCaseFuture<List<ProductModel>, NoParam> {
  final IProductRepository? iProductRepository;

  GetAllProductUseCase({this.iProductRepository});

  @override
  Future<List<ProductModel>> call(NoParam params) async {
    List<ProductModel> listProduct = await iProductRepository!.getAllProduct();
    return listProduct;
  }
}

class AddProductUseCase extends UseCaseFuture<int, ProductModel> {
  final IProductRepository? iProductRepository;

  AddProductUseCase({this.iProductRepository});

  @override
  Future<int> call(ProductModel params) async {
    var id = await iProductRepository!.addProduct(params);
    return id;
  }
}

class UpdateProductUseCase extends UseCaseFuture<int, ProductModel> {
  final IProductRepository? iProductRepository;

  UpdateProductUseCase({this.iProductRepository});

  @override
  Future<int> call(ProductModel params) async {
    var id = await iProductRepository!.updateProduct(params);
    return id;
  }
}

class DeleteProductUseCase extends UseCaseFuture<int, int> {
  final IProductRepository? iProductRepository;

  DeleteProductUseCase({this.iProductRepository});

  @override
  Future<int> call(int params) async {
    var id = await iProductRepository!.deleteProduct(params);
    return id;
  }
}
