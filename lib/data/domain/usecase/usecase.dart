abstract class UseCase<Type, Params> {
  Type call(Params params);
}

abstract class UseCaseFuture<Type, Params> {
  Future<Type> call(Params params);
}

abstract class UseCaseFutureTwoParam<Type, Param1, Param2> {
  Future<Type> call(Param1 param1, Param2 param2);
}

// abstract class UseCaseNoError<Type, Params> {
//   Type call(Params params);
// }

// abstract class UseCaseNoErrorFuture<Type, Params> {
//   Future<Type> call(Params params);
// }
