import 'package:ecommerce_crud_operation/app/modules/auth/application/login/login_binding.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/repository/auth_repo.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/infrastructure/data_sources/auth_local_data_source.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/presentation/login_view.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/application/register/register_binding.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/presentation/register_view.dart';
import 'package:get/get.dart';

import '../modules/auth/application/profile/profile_binding.dart';
import '../modules/auth/presentation/profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/product//add_product/bindings/add_product_binding.dart';
import '../modules/product/add_product/views/add_product_view.dart';
import '../modules/product/all_products/bindings/all_products_binding.dart';
import '../modules/product/all_products/views/all_products_view.dart';
import '../modules/product/product_details/bindings/product_details_binding.dart';
import '../modules/product/product_details/views/product_details_view.dart';

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
      binding: AddProductBinding(),
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
