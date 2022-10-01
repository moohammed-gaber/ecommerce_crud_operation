import 'package:ecommerce_crud_operation/app/modules/product/domain/value_objects/product_size.dart';

abstract class AddSizeViewContract {
  onSizeAdded(ProductSize productSize);

  onFailed();
}
