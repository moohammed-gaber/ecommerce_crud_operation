import 'package:dartz/dartz.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/value_object.dart';

class ProductPrice {
  static Either<ValueFailure<String>, num> validate(num input) {
    if (input > 0) {
      return right(input);
    }
    return left(ValueFailure());
  }

  @override
  final Either<ValueFailure<String>, num> value;

  factory ProductPrice(num input) {
    return ProductPrice._(
      validate(input),
    );
  }

  const ProductPrice._(this.value);
}
