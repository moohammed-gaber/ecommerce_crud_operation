import 'package:dio/dio.dart';
import 'package:ecommerce_crud_operation/app/core/device/custom_file_picker.dart';
import 'package:ecommerce_crud_operation/app/core/device/device_permission.dart';
import 'package:ecommerce_crud_operation/app/core/repos/product_repo.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_color/add_color_controller.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_color/add_color_state.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_size/add_size_controller.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_size/add_size_state.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/repos/add_product_repo.dart';
import 'package:ecommerce_crud_operation/app/routes/app_pages.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DevicePermissions().askForLocationAndStoragePermissions();
    return GetMaterialApp(
      initialBinding: AppBinding(),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductRepoImpl(Dio()));
    Get.lazyPut(() => CustomFilePicker(FilePicker.platform));
    Get.lazyPut(() => AddProductRepo(Get.find<ProductRepoImpl>(), Get.find()));
    Get.lazyPut(() => AddColorController(AddColorState.initial(), Get.find()),
        fenix: true);
    Get.lazyPut(
        () => AddSizeController(
              AddSizeState.initial(),
            ),
        fenix: true);
  }
}
