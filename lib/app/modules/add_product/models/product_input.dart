import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_variant.dart';
import 'package:ecommerce_crud_operation/app/core/models/product_color_widget_model.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_name.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_price.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';
import 'package:file_picker/file_picker.dart';

class ProductInput {
  final List<ProductColorWidgetModel> productColors;
  final List<ProductSize> productSizes;
  final List<ProductVariant> variants;
  final ProductName name;

  ProductInput(
      {required this.productColors,
      required this.productSizes,
      required this.name,
      required this.variants});
  Future<Map<String, dynamic>> toJsonFormData(ProductInput input) async {

    final colors = await Future.wait(input.productColors.map((e) async {
      print(e.color.images);
      final images = (e.color.images
          .map((e) => MultipartFile.fromFile(
                e.path,
              ))
          .toList());
      final colorImages = await Future.wait(images);

      return {
        'colorImages': colorImages,
        'colorName': e.color.color.getOrCrash()
      };
    }).toList());
    print('colors is $colors');

    return {
      'productName': input.name.getOrCrash(),
      'productColors': colors,
      'productSizes': input.productSizes.map((e) => e.value.value).toList(),
      'productVariations': input.variants
          .map((e) => {
                'variantPrice': e.productPrice.getOrCrash(),
                'variantAttributes': {
                  'variantSize': e.productSize.value.value,
                  'variantColor': {'colorName': e.productColor.getOrCrash()},
                },
              })
          .toList(),
    };
  }
}
