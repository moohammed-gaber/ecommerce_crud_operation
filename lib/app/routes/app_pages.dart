import 'package:get/get.dart';

import '../modules/product//add_product/bindings/add_product_binding.dart';
import '../modules/product/add_product/views/add_product_view.dart';
import '../modules/product/all_products/bindings/all_products_binding.dart';
import '../modules/product/all_products/views/all_products_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/product/product_details/bindings/product_details_binding.dart';
import '../modules/product/product_details/views/product_details_view.dart';
import '../modules/auth/profile/bindings/profile_binding.dart';
import '../modules/auth/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ALL_PRODUCTS;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
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
  ];
}
