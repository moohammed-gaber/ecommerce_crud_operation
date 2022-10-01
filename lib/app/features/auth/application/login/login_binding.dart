import 'package:ecommerce_crud_operation/app/features/auth/application/login/login_state.dart';
import 'package:ecommerce_crud_operation/app/features/auth/domain/repository/auth_repo.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
          () => LoginController(Get.find<AuthRepo>(), LoginState.initial()),
    );
  }
}
