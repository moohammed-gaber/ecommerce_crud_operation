import 'dart:io';

import 'package:ecommerce_crud_operation/app/core/entities/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_color.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_color/add_color_state.dart';
import 'package:file_picker/file_picker.dart';

abstract class AddColorViewContract {
  onSuccess(ProductColorInput productColorInput);
  onFailed();


}
