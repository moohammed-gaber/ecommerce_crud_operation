import 'package:dartz/dartz.dart';
import 'package:ecommerce_crud_operation/app/core/domain/value_objects/value_object.dart';
import 'package:email_validator/email_validator.dart';

class UserEmail extends ValueObject<String> {
  static Either<ValueFailure<String>, String> validate(String input) {
    if (EmailValidator.validate(input)) {
      return right(input);
    } else {
      return left(ValueFailure());
    }
  }

  @override
  final Either<ValueFailure<String>, String> value;

  factory UserEmail(String input) {
    return UserEmail._(
      validate(input),
    );
  }

  const UserEmail._(this.value);
}
