import 'dart:io';

import 'package:ecommerce_crud_operation/app/core/entities/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/core/models/product_color_widget_model.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_color.dart';
import 'package:file_picker/file_picker.dart';

class ProductColorInput {
  final List<PlatformFile> images;
  final ProductColorValueObject color;

  ProductColorInput({required this.images, required this.color});
  // initial
  factory ProductColorInput.initial() {
    return ProductColorInput(images: [], color: ProductColorValueObject(''));
  }

  // copy with optional
  ProductColorInput copyWith(
      {List<PlatformFile>? images, ProductColorValueObject? color}) {
    return ProductColorInput(
        images: images ?? this.images, color: color ?? this.color);
  }
}

class AddProductState {
  final ProductColorInput productColor;
  final List<ProductColorWidgetModel> productColors;
  final int selectedColorIndex;
  AddProductState(
      this.productColors, this.productColor, this.selectedColorIndex);
  // copy with
  AddProductState copyWith({
    List<ProductColorWidgetModel>? productColors,
    ProductColorInput? productColor,
    int? selectedColorIndex,
  }) {
    return AddProductState(
      productColors ?? this.productColors,
      productColor ?? this.productColor,
      selectedColorIndex ?? this.selectedColorIndex,
    );
  }

  // initial state
  factory AddProductState.initial() {
    return AddProductState(
      [],
      ProductColorInput.initial(),
      -1
    );
  }
}
