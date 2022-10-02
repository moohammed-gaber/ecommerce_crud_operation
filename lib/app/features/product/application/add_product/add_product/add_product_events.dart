import 'package:ecommerce_crud_operation/app/features/product/domain/value_objects/product_name.dart';
import 'package:ecommerce_crud_operation/app/features/product/domain/value_objects/product_price.dart';

abstract class AddProductEvents {

  void onTapSizeCard(int index);


  void onNameTextFieldChanged(ProductName name);

  void onTapGenerateVariationButton();

  void onTapAddProductButton();

  void onTapVariantCard(int index);
}
