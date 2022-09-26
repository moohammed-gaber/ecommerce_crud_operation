import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/core/failures/failure.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_product/add_product_state.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/models/product_input.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<Product>>> getAll();
  Future<Either<Failure, Product>> getById(String id);
  Future<Either<Failure, Product>> add(ProductInput product);
}

class ProductRepoImpl implements ProductRepo {
  ProductRepoImpl(this._dio);

  final Dio _dio;

  @override
  Future<Either<Failure, Product>> add(ProductInput product) async {
    try {
      final body =await  product.toJsonFormData(product);
      print('body is $body');
      final result = await _dio.post('/add-product',
          options: Options(
            headers: {
              'Accept': 'application/json',
            },
          ),

          data:FormData.fromMap(body));
      return right(result.data);
    } catch (e) {
      rethrow;
      return left(Failure());
    }
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
