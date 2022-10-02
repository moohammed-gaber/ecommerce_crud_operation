import 'package:ecommerce_crud_operation/app/core/domain/failures/failure.dart';

abstract class ProfileViewContract{
  void onLogoutSuccess();
  void onLogoutFailed(Failure failure);
}