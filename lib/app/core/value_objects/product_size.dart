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

/*
class SmallProductSize extends ProductSize {
  static const ProductSizeEnum _value = ProductSizeEnum.small;
  SmallProductSize() : super._(right(_value));
}

class MediumProductSize extends ProductSize {
  static const ProductSizeEnum _value = ProductSizeEnum.medium;
  MediumProductSize() : super._(right(_value));
}

class LargeProductSize extends ProductSize {
  static const ProductSizeEnum _value = ProductSizeEnum.large;
  LargeProductSize() : super._(right(_value));
}
*/
