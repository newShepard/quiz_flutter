import 'package:dartz/dartz.dart';
import 'package:quiz_flutter/core/error/exceptions.dart';

abstract class UseCase<Type, Params> {
  Future<Either<QuizError, Type>> call(Params params);
}
