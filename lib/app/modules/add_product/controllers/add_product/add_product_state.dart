import 'dart:io';

import 'package:ecommerce_crud_operation/app/core/entities/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/core/models/product_color_widget_model.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';
import 'package:file_picker/file_picker.dart';

class AddProductState {
  final List<ProductColorWidgetModel> productColors;
  final List<ProductSize> productSizes;
  final int selectedColorIndex;
  final int selectedSizeIndex;

  AddProductState(this.productColors, this.selectedColorIndex,
      this.productSizes, this.selectedSizeIndex);
  // copy with
  AddProductState copyWith({
    List<ProductColorWidgetModel>? productColors,
    int? selectedColorIndex,
    List<ProductSize>? productSizes,
    int? selectedSizeIndex,
  }) {
    return AddProductState(
      productColors ?? this.productColors,
      selectedColorIndex ?? this.selectedColorIndex,
      productSizes ?? this.productSizes,
      selectedSizeIndex ?? this.selectedSizeIndex,
    );
  }

  //add color
  AddProductState addColor(ProductColorWidgetModel productColor) {
    return copyWith(
      productColors: [...productColors, productColor],
    );
  }

//add size
  AddProductState addSize(ProductSize productSize) {
    return copyWith(
      productSizes: [...productSizes, productSize],
    );
  }

  // initial state
  factory AddProductState.initial() {
    return AddProductState([], -1, [], -1);
  }
}
