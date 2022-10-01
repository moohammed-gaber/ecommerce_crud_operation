import 'package:ecommerce_crud_operation/app/features/auth/application/profile/profile_state.dart';
import 'package:get/get.dart';

import 'profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(
          ProfileState(ProfileDataLoadingInProgress()), Get.find()),
    );
  }
}
