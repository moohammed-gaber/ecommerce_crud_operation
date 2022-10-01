import 'package:ecommerce_crud_operation/app/core/failures/failure.dart';

abstract class LoginViewContract {
  onSuccess();

  onFailed(Failure failure);

  bool validateForm();
}
