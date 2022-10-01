import 'package:dartz/dartz.dart';
import 'package:ecommerce_crud_operation/app/core/domain/value_objects/value_object.dart';

class UserFullName extends ValueObject<String> {
  static Either<ValueFailure<String>, String> validate(String input) {
    if (input.length > 4) {
      return right(input);
    } else {
      return left(ValueFailure());
    }
  }

  @override
  final Either<ValueFailure<String>, String> value;

  factory UserFullName(String input) {
    return UserFullName._(
      validate(input),
    );
  }

  const UserFullName._(this.value);
}
