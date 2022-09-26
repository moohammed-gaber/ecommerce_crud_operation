import 'package:dartz/dartz.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/value_object.dart';

class ProductName extends ValueObject<String> {
  static Either<ValueFailure<String>, String> validate(String input) {
    if (input.length > 4) {
      return right(input);
    } else {
      return left(ValueFailure());
    }
  }

  @override
  final Either<ValueFailure<String>, String> value;

  factory ProductName(String input) {
    return ProductName._(
      validate(input),
    );
  }

  const ProductName._(this.value);
}
