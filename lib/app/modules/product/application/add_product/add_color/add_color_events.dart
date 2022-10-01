import 'package:ecommerce_crud_operation/app/modules/product/domain/value_objects/product_color.dart';

abstract class AddColorEvents {
  void onPickImages();

  void onChangedColorTextField(ProductColorValueObject color);

  void onAddColor();
}
