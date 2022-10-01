import 'package:dartz/dartz.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/value_object.dart';

class ProductColorValueObject extends ValueObject<String> {
  static Either<ValueFailure<String>, String> validate(String input) {
    if (input.length > 2) {
      return right(input);
    } else {
      return left(ValueFailure());
    }
  }

  @override
  final Either<ValueFailure<String>, String> value;

  factory ProductColorValueObject(String input) {
    return ProductColorValueObject._(
      validate(input),
    );
  }

  // copy with
  ProductColorValueObject copyWith(String color) {
    return ProductColorValueObject(color);
  }

  const ProductColorValueObject._(this.value);
}
