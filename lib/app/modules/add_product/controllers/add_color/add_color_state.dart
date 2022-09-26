import 'dart:io';

import 'package:ecommerce_crud_operation/app/core/entities/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/core/models/product_color_widget_model.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_color.dart';
import 'package:file_picker/file_picker.dart';

class ProductColorInput {
  final List<File> images;
  final ProductColorValueObject color;

  ProductColorInput({required this.images, required this.color});
  // initial
  factory ProductColorInput.initial() {
    return ProductColorInput(images: [], color: ProductColorValueObject(''));
  }

  // copy with optional
  ProductColorInput copyWith(
      {List<File>? images, ProductColorValueObject? color}) {
    return ProductColorInput(
        images: images ?? this.images, color: color ?? this.color);
  }
}

class AddColorState {
  final ProductColorInput productColor;
  AddColorState(
       this.productColor,);
  // copy with
  AddColorState copyWith({
    ProductColorInput? productColor,
  }) {
    return AddColorState(
      productColor ?? this.productColor,
    );
  }

  // initial state
  factory AddColorState.initial() {
    return AddColorState(
      ProductColorInput.initial(),
    );
  }
}
