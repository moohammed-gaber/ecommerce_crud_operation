import 'package:ecommerce_crud_operation/app/core/domain/failures/failure.dart';

class InvalidEmailOrPasswordFailure extends Failure {
  InvalidEmailOrPasswordFailure();
}

class EmailAlreadyExistsFailure extends Failure {
  EmailAlreadyExistsFailure();
}
