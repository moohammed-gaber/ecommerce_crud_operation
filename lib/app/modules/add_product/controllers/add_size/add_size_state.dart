import 'dart:io';

import 'package:ecommerce_crud_operation/app/core/entities/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/core/models/product_color_widget_model.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';
import 'package:file_picker/file_picker.dart';

class AddSizeState {
  final sizes = ProductSize.sizes;
  ProductSize get selectedSize =>sizes[selectedIndex];
  final int selectedIndex;

  AddSizeState(this.selectedIndex);
  // initial
  factory AddSizeState.initial() => AddSizeState(-1);
  // copyWith
  AddSizeState copyWith({
    int? selectedIndex,
  }) {
    return AddSizeState(
      selectedIndex ?? this.selectedIndex,
    );
  }
}
