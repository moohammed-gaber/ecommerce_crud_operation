import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';

abstract class AddSizeViewContract {
  onSuccess(ProductSize productSize);

  onFailed();
}
