import 'package:firebase_example/data/domain/entity/no_param.dart';
import 'package:firebase_example/data/domain/repository/app_repository_interface.dart';
import 'package:firebase_example/data/domain/usecase/usecase.dart';

class CreateFolderUseCase extends UseCaseFuture<int, NoParam> {
  final IAppRepository? appRepository;

  CreateFolderUseCase({this.appRepository});

  @override
  Future<int> call(NoParam params) async {
    return await appRepository!.createFolder();
  }
}
