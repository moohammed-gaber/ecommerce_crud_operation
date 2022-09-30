import 'package:ecommerce_crud_operation/app/core/entities/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_variant.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_name.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';

class Product {
  final String id;
  final List<String> images;
  final List<ProductVariant> productVariants;
  final List<ProductColor> productColors;
  final List<ProductSize> productSizes;
  final ProductName productName;

  Product(
      {required this.id,
      required this.images,
      required this.productVariants,
      required this.productColors,
      required this.productSizes,
      required this.productName});

  // copy with
  Product copyWith({
    String? id,
    List<String>? images,
    List<ProductVariant>? productVariants,
    List<ProductColor>? productColors,
    List<ProductSize>? productSizes,
    ProductName? productName,
  }) {
    return Product(
      id: id ?? this.id,
      images: images ?? this.images,
      productVariants: productVariants ?? this.productVariants,
      productColors: productColors ?? this.productColors,
      productSizes: productSizes ?? this.productSizes,
      productName: productName ?? this.productName,
    );
  }

  // initial state
  factory Product.initial() {
    return Product(
        id: '',
        images: [],
        productVariants: [],
        productColors: [],
        productSizes: [],
        productName: ProductName(''));
  }
}
