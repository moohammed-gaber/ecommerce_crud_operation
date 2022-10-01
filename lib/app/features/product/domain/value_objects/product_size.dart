import 'package:dartz/dartz.dart';
import 'package:ecommerce_crud_operation/app/core/domain/value_objects/value_object.dart';

enum ProductSizeEnum {
  small('small', 'S'),
  medium('medium', 'M'),
  large('large', 'L');

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

class ProductSize extends ValueObject<String> {
  static Either<ValueFailure<String>, String> validate(String input) {
    return right(input);

    if (input.length > 2) {
      return right(input);
    } else {
      return left(ValueFailure());
    }
  }

  @override
  final Either<ValueFailure<String>, String> value;

  factory ProductSize(String input) {
    return ProductSize._(
      validate(input),
    );
  }

  // copy with
  ProductSize copyWith(String color) {
    return ProductSize(color);
  }

  const ProductSize._(this.value);
}
