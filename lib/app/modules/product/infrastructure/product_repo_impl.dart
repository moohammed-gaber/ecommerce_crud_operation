import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_crud_operation/app/core/failures/failure.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/mappers/add_product_mapper.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/models/product_input.dart';
import 'package:ecommerce_crud_operation/app/modules/product/domain/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/modules/product/domain/repository/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  ProductRepoImpl(this._dio);

  final Dio _dio;

  @override
  Future<Either<Failure, Product>> add(ProductInput product) async {
    try {
      final body = await product.toJsonFormData();
      final mapper = ProductMapper();

      final result = await _dio.post('/add-product',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
          data: FormData.fromMap(body));

      return right((result.data)!);
    } catch (e) {
      rethrow;
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAll() async {
    try {
      final result = await _dio.get(
        '/get-all-products',
      );
      final mapper = ProductMapper();
      final List resultData = result.data['products'];
      print(resultData.length);
      final products = <Product>[];
      for (int i = 0; i < resultData.length; i++) {
        final e = resultData[i];

        final product = mapper.fromJson(e);
        print('product: ${product}');

        if (product != null) {
          products.add(product);
        }
        print('products: ${products.length}');
      }
      return right(products.reversed.toList());
    } catch (e) {
      rethrow;
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, Product>> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }
}
