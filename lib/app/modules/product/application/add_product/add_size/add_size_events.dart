import 'package:ecommerce_crud_operation/app/modules/product/domain/value_objects/product_size.dart';

abstract class AddSizeEvents {
  void onTapAddSizeButton();

  void onChangeSizeTextField(ProductSize text);
}
