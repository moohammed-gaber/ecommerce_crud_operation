import 'package:ecommerce_crud_operation/app/features/auth/application/login/login_binding.dart';
import 'package:ecommerce_crud_operation/app/features/auth/application/register/register_binding.dart';
import 'package:ecommerce_crud_operation/app/features/auth/domain/repository/auth_repo.dart';
import 'package:ecommerce_crud_operation/app/features/auth/presentation/login_view.dart';
import 'package:ecommerce_crud_operation/app/features/auth/presentation/register_view.dart';
import 'package:get/get.dart';

import '../../../features/auth/application/profile/profile_binding.dart';
import '../../../features/auth/presentation/profile_view.dart';
import '../../../features/home/application/home_binding.dart';
import '../../../features/home/presentation/home_view.dart';
import '../../../features/product/application/all_products/all_products_binding.dart';
import '../../../features/product/application/product_details/product_details_binding.dart';
import '../../../features/product/presentation/add_product/add_product_view.dart';
import '../../../features/product/presentation/all_products/all_products_view.dart';
import '../../../features/product/presentation/product_details/product_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages(this.repo);

  final AuthRepo repo;

  String get initialRoute =>
      repo.getSavedToken() == null ? Routes.LOGIN : Routes.HOME;

  final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => AddProductView(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ALL_PRODUCTS,
      page: () => const AllProductsView(),
      binding: AllProductsBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
