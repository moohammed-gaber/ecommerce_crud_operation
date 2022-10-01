import 'package:ecommerce_crud_operation/app/core/infrastructure/injection/injection.dart';
import 'package:ecommerce_crud_operation/app/core/presentation/widgets/custom_material_app.dart';
import 'package:ecommerce_crud_operation/app/core/application/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection().dependencies();
  runApp(CustomMaterialApp(
    appPages: Get.find<AppPages>(),
  ));
}
