import 'package:ecommerce_crud_operation/app/core/config/dio.dart';
import 'package:ecommerce_crud_operation/app/core/device/custom_file_picker.dart';
import 'package:ecommerce_crud_operation/app/core/device/device_permission.dart';
import 'package:ecommerce_crud_operation/app/core/repos/product_repo.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/controllers/add_color/add_color_controller.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/controllers/add_color/add_color_state.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/controllers/add_size/add_size_controller.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/controllers/add_size/add_size_state.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/mappers/add_product_mapper.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/repos/add_product_repo.dart';
import 'package:ecommerce_crud_operation/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
/*
    print()
*/
/*
    for(int i=0;i<5;i++){
      if(i==1){
        continue;
      }
      print(i);

    }
*/

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
    final configuredDio = Get.put(ConfiguredDio(
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjYzMzA5YjU4ZTI2NzJlZjgyYzExZjljNCJ9LCJpYXQiOjE2NjQxMzAzMjgsImV4cCI6MTY2NjcyMjMyOH0.DqSofh2BAwe_qsr6RPMHOlbIb8eHPr4EGkgHSLk1J5E'));

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
