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

  Product(this.id, this.images, this.productVariants, this.productColors,
      this.productSizes, this.productName);
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
      id ?? this.id,
      images ?? this.images,
      productVariants ?? this.productVariants,
      productColors ?? this.productColors,
      productSizes ?? this.productSizes,
      productName ?? this.productName,
    );
  }

  // initial state
  factory Product.initial() {
    return Product(
      '',
      [],
      [],
      [],
      [],
      ProductName(''),
    );
  }
}
