import 'package:ecommerce_crud_operation/app/core/entities/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_name.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_product_state.dart';
import 'package:file_picker/file_picker.dart';

abstract class AddProductEvents {
  void onPickImages();
  void onChangedColorTextField(ProductColorValueObject color);
  void onAddColor();
  void onTapProductColor(int index);
}
