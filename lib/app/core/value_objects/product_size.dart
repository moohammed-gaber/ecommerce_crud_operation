import 'package:dartz/dartz.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/value_object.dart';

enum ProductSizeEnum {
  small('Small'),
  medium('Medium'),
  large('Large');

  const ProductSizeEnum(this.value);
  final String value;
}

class ProductSize {
  static final sizes = [
    ProductSize(ProductSizeEnum.small),
    ProductSize(ProductSizeEnum.medium),
    ProductSize(ProductSizeEnum.large),
  ];
  final ProductSizeEnum value;

  factory ProductSize(ProductSizeEnum input) {
    return ProductSize._(
      (input),
    );
  }

  const ProductSize._(this.value);
}

