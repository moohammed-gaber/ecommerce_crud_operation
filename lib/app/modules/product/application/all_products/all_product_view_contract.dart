import 'package:ecommerce_crud_operation/app/modules/product/domain/entities/product_entity.dart';

abstract class AllProductViewContract {
  onAddProductSuccess();

  onAddProductFailed();

  onSuccessAddVariation();

  Future<Product?> navigateToAddProduct();
}
