import 'package:ecommerce_crud_operation/app/modules/auth/application/register/register_state.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/repository/auth_repo.dart';
import 'package:get/get.dart';

import 'register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(Get.find<AuthRepo>(), RegisterState.initial()),
    );
  }
}
