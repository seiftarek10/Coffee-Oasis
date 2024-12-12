import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<functionTP, param> {
  Future<Either<Failure, functionTP>> execute({param? param});
}
