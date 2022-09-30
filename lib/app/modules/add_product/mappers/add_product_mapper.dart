import 'dart:io';

import 'package:ecommerce_crud_operation/app/core/entities/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_variant.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_name.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_price.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_product/add_product_state.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/models/product_input.dart';

class ProductMapper {
  Map<String, dynamic> ProductInputToJson(ProductState input) {
    return {
      'productName': input.name.value,
      'productColors': input.productColors
          .map((e) => {
                'colorImages': e.color.images
                    .map((e) => File(
                          e.path!,
                        ))
                    .toList(),
                'colorName': e.color.color.getOrCrash()
              })
          .toList(),
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

  ProductInput productInputFromState(ProductState state) {
    return ProductInput(
        productColors: state.productColors,
        productSizes: state.productSizes,
        name: state.name,
        variants: state.variants);
  }

  Product fromJson(Map json) {
    final colorsAndSizes = json['productOptions'];
    return Product(
        productName: ProductName(json['productName']),
        id: json['_id'],
        productVariants: (json['productVariants'] as List).map((e) {
          final colorAndPrice = e['variantAttributes'];

          return ProductVariant(
              productColor: ProductColorValueObject(
                  colorAndPrice['variantColor']['colorName']),
              productPrice: ProductPrice(colorAndPrice['variantPrice']),
              productSize: ProductSize(colorAndPrice['variantSize']));
        }).toList(),
        images: [],
        productColors: (colorsAndSizes['productColors'] as List)
            .map((e) => ProductColor(
                (e['colorImages'] as List).cast<String>(), e['colorName']))
            .toList(),
        productSizes: (colorsAndSizes['productSizes'] as List)
            .map((e) => ProductSize(e))
            .toList());
  }
}
