import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/core/failures/failure.dart';

abstract class ProductRepo  {
  Future<Either<Failure, List<Product>>> getAll();
  Future<Either<Failure, Product>> getById(String id);
  Future<Either<Failure, Product>> add(Product product);
}

class ProductRepoImpl implements ProductRepo{
  ProductRepoImpl(this._dio);

  final Dio _dio;

  @override
  Future<Either<Failure, Product>> add(Product product) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Product>>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Product>> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }


}
