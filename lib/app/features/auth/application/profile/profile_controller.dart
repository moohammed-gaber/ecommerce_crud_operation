import 'package:ecommerce_crud_operation/app/features/auth/application/profile/profile_state.dart';
import 'package:ecommerce_crud_operation/app/features/auth/domain/repository/auth_repo.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileState state;
  final AuthRepo repo;

  ProfileController(this.state, this.repo);

  Future<void> getMyProfile() async {
    state = state.copyWith(dataState: ProfileDataLoadingInProgress());
    update();
    final profile = await repo.getMyProfile();
    state = state.copyWith(
        dataState: profile.fold((l) => ProfileDataFailure(),
            (r) => ProfileDataLoadingSuccess(user: r)));
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getMyProfile();
  }
}
