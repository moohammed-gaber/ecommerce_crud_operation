import 'package:dartz/dartz.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/value_object.dart';

enum ProductSizeEnum {
  small('Small', 'S'),
  medium('Medium', 'M'),
  large('Large', 'L');

  const ProductSizeEnum(this.value, this.sign);
  final String value;
  final String sign;
  String get lowerCasedSign => sign.toLowerCase();
}
/*
abstract class TestT {
  void test();

}
enum Test implements TestT {
  hello

}
*/

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
  x() {
    ProductSizeEnum.large.lowerCasedSign;
  }

  const ProductSize._(this.value);
}
