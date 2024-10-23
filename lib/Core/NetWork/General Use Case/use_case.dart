import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<rt,param> {
  Future<Either<Failure, rt>> execute({param? param});
}
