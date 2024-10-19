import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:dartz/dartz.dart';

abstract class OwnerRepo {
  Future<Either<Failure, String>> addCategory(
      {required CategoryEntity category});
}
