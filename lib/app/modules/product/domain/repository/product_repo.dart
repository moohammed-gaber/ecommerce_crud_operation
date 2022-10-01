import 'package:dartz/dartz.dart';
import 'package:ecommerce_crud_operation/app/core/domain/failures/failure.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/models/product_input.dart';
import 'package:ecommerce_crud_operation/app/modules/product/domain/entities/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<Product>>> getAll();

  Future<Either<Failure, Product>> getById(String id);

  Future<Either<Failure, Product>> add(ProductInput product);
}
