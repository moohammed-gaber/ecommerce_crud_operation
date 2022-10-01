import 'package:ecommerce_crud_operation/app/core/value_objects/product_color.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/value_objects/user_email.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/value_objects/user_password.dart';

abstract class LoginEvents {
  void onChangeEmailTextField(UserEmail email);
  void onChangePasswordTextField(UserPassword password);
  void onTapLoginButton();
}
