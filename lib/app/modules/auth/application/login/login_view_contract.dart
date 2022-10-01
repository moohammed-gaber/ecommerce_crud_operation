import 'package:ecommerce_crud_operation/app/core/failures/failure.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/controllers/add_color/add_color_state.dart';

abstract class LoginViewContract {
  onSuccess();
  onFailed(Failure failure);
  bool validateForm();
}
