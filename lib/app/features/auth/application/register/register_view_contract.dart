import 'package:ecommerce_crud_operation/app/core/domain/failures/failure.dart';

abstract class RegisterViewContract {
  onSuccess();

  onFailed(Failure failure);

  bool validateForm();
}
