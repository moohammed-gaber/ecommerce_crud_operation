import 'dart:io';
import 'package:dio/dio.dart';
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
import 'package:http_parser/http_parser.dart';

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
    /*
       final color = input.productColors[0].color;
    final multiPartFile = await MultipartFile.fromFile(color.images[0].path,
        filename: color.images[0].path.split('/').last,
        contentType: MediaType('image', 'jpeg'));

    print(multiPartFile.length);
    print(color.images[0].path);


      final colors = [
      {
        'colorImages': [
          multiPartFile,
        ],
        'colorName': color.color.getOrCrash()
      }
    ];*/
/*
    final FormData formData = FormData();
    formData.files.add(MapEntry('productColors[0][colorImages][]', multiPartFile));
    formData.fields.add(MapEntry('productColors[0][colorName]', color.color.getOrCrash()));
    return formData;
*/
    final colors = await Future.wait(input.productColors.map((e) async {
      print(e.color.images);
      final color = e.color;
      final images = color.images
          .map((e) => MultipartFile.fromFile(e.path,
              contentType: MediaType('image', 'jpeg')))
          .toList();
      final colorImages = await Future.wait(images);

      return {
        'colorImages': colorImages,
        'colorName': color.color.getOrCrash()
      };
    }).toList());
    final variations = input.variants
        .map((e) => {
              'variantPrice': e.productPrice.getOrCrash(),
              'variantAttributes': {
                'variantSize': e.productSize.value.value,
                'variantColor': {'colorName': e.productColor.getOrCrash()},
              },
            })
        .toList();
    final sizes = input.productSizes.map((e) => e.value.value).toList();
    print('---> ');
    print('variations.length ${variations.length}');
    print('sizes is ${sizes.length}');
    print('colors.length ${colors.length}');
    print('---> ');

    final map = {
      'productName': input.name.getOrCrash(),
      'productColors': [...colors],
      'productSizes': sizes,
      'productVariations': [...variations, ],
    };
    return (map);
  }
}
