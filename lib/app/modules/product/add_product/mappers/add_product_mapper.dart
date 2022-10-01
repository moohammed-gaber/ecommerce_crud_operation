import 'dart:io';

import 'package:ecommerce_crud_operation/app/modules/product/domain/entities/product_color.dart';
import 'package:ecommerce_crud_operation/app/modules/product/domain/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/modules/product/domain/entities/product_variant.dart';
import 'package:ecommerce_crud_operation/app/modules/product/domain/value_objects/product_color.dart';
import 'package:ecommerce_crud_operation/app/modules/product/domain/value_objects/product_name.dart';
import 'package:ecommerce_crud_operation/app/modules/product/domain/value_objects/product_price.dart';
import 'package:ecommerce_crud_operation/app/modules/product/domain/value_objects/product_size.dart';
import 'package:ecommerce_crud_operation/app/modules/product/application/add_product/add_product/add_product_state.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/models/product_input.dart';

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
      'productSizes': input.productSizes.map((e) => e.getOrCrash()).toList(),
      'productVariations': input.variants
          .map((e) => {
                'variantPrice': e.productPrice.getOrCrash(),
                'variantAttributes': {
                  'variantSize': e.productSize.getOrCrash(),
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

  Product? fromJson(Map json) {
    final colorsAndSizes = json['productOptions'];
    final variantsJson = (json['productVariants'] as List);
    final variants = <ProductVariant>[];

    for (var i = 0; i < variantsJson.length; i++) {
      final e = variantsJson[i];
      final colorAndSize = e['variantAttributes'];
      if (colorAndSize == null || e['variantPrice'] == null) {
        return null;
      }
      ProductSize? size;
      try {
        size = ProductSize(colorAndSize['variantSize'] as String);
      } catch (e) {
        print(e);
        return null;
      }
      late ProductPrice variantPrice;

      final parsedPrice = num.tryParse(e['variantPrice']);
      if (parsedPrice == null) {
        print('parsedPrice is $e');
        return null;
      }
      variantPrice = ProductPrice(parsedPrice);

      variants.add(ProductVariant(
          productColor: ProductColorValueObject(
              colorAndSize['variantColor']['colorName']),
          productPrice: variantPrice,
          productSize: size));
    }
    return Product(
        productName: ProductName(json['productName']),
        id: json['_id'],
        productVariants: variants,
        images: [],
        productColors: (colorsAndSizes['productColors'] as List)
            .map((e) => ProductColor((e['colorImages'] as List).cast<String>(),
                ProductColorValueObject(e['colorName'])))
            .toList(),
        productSizes: (colorsAndSizes['productSizes'] as List)
            .map((e) => ProductSize(e))
            .toList());
  }
}
