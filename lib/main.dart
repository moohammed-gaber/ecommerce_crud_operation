import 'package:ecommerce_crud_operation/app/core/device/device_permission.dart';
import 'package:ecommerce_crud_operation/app/core/injection/AppBinding.dart';
import 'package:ecommerce_crud_operation/app/core/widgets/custom_material_app.dart';
import 'package:ecommerce_crud_operation/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppBinding().dependencies();
  runApp(CustomMaterialApp(
    appPages: Get.find<AppPages>(),
  ));
}
