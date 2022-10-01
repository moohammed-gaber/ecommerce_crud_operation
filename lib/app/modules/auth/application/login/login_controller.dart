import 'package:ecommerce_crud_operation/app/core/config/dio.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/application/login/login_events.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/application/login/login_state.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/application/login/login_view_contract.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/repository/auth_repo.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/value_objects/user_email.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/value_objects/user_password.dart';
import 'package:get/get.dart';

class LoginController extends GetxController implements LoginEvents {
  final AuthRepo repo;
  LoginState state;
  late final LoginViewContract view;

  LoginController(this.repo, this.state);

  @override
  void onChangeEmailTextField(UserEmail email) {
    state = state.copyWith(
      email: email,
    );
  }

  @override
  void onChangePasswordTextField(UserPassword password) {
    state = state.copyWith(
      password: password,
    );
  }

  @override
  Future<void> onTapLoginButton() async {
    final isValid = view.validateForm();
    if (!isValid) return;
    final email = state.email;
    final password = state.password;
    final result = await repo.login(email, password);
    result.fold((l) => view.onFailed(l), (r) {
      final configuredDio = Get.find<ConfiguredDio>();
      configuredDio.updateToken(r.token.getOrCrash());
      return view.onSuccess();
    });
  }
}
