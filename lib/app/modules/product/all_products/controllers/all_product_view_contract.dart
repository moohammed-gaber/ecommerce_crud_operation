import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';

abstract class AllProductViewContract {
  onAddProductSuccess();

  onAddProductFailed();

  onSuccessAddVariation();

  Future<Product?> navigateToAddProduct();
}
