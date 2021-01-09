import 'package:dartz/dartz.dart';
import 'package:quiz_flutter/core/error/failrues.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
