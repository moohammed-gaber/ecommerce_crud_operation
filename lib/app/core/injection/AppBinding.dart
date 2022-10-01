import 'package:ecommerce_crud_operation/app/core/config/dio.dart';
import 'package:ecommerce_crud_operation/app/core/device/custom_file_picker.dart';
import 'package:ecommerce_crud_operation/app/core/device/device_permission.dart';
import 'package:ecommerce_crud_operation/app/core/repos/product_repo.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/repository/auth_repo.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/infrastructure/data_sources/auth_local_data_source.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/infrastructure/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/infrastructure/repositories/auth_repo_impl.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/controllers/add_color/add_color_controller.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/controllers/add_color/add_color_state.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/controllers/add_size/add_size_controller.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/controllers/add_size/add_size_state.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/mappers/add_product_mapper.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/repos/add_product_repo.dart';
import 'package:ecommerce_crud_operation/app/modules/product/all_products/controllers/all_products_controller.dart';
import 'package:ecommerce_crud_operation/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../modules/product/all_products/controllers/add_product_state.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    await GetStorage.init();
    Get.lazyPut<GetStorage>(() => GetStorage());
    Get.lazyPut<AllProductsController>(
          () => AllProductsController(
          AllProductState.initial(), Get.find<ProductRepoImpl>()),
      fenix: true
    );

    Get.lazyPut<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(Get.find()));
    final token = Get.find<AuthLocalDataSource>().getToken();
    final configuredDio = Get.put(ConfiguredDio(token));

    Get.lazyPut<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(configuredDio.dio));

    Get.lazyPut<AuthRepo>(() => AuthRepoImpl(Get.find(), Get.find()));
    Get.lazyPut<AppPages>(() => AppPages(Get.find()));

    Get.lazyPut(() => ProductRepoImpl(configuredDio.dio));
    Get.lazyPut(() => CustomFilePicker(ImagePicker()));
    Get.lazyPut(() => AddProductRepo(
        Get.find<ProductRepoImpl>(), Get.find(), ProductMapper()));
    Get.lazyPut(() => AddColorController(AddColorState.initial(), Get.find()),
        fenix: true);
    Get.lazyPut(
        () => AddSizeController(
              AddSizeState.initial(),
            ),
        fenix: true);
  }
}
