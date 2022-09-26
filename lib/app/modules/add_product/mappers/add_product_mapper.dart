import 'dart:io';

import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_product/add_product_state.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/models/product_input.dart';

class AddProductMapper {
  Map<String, dynamic> ProductInputToJson(ProductState input) {
    return {
      'productName': input.name.value,
      'productColors': input.productColors
          .map((e) => {
                'colorImages':
                    e.color.images.map((e) => File(e.path!,)).toList(),
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
}
