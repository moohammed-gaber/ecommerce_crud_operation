import 'package:ecommerce_crud_operation/app/core/device/device_permission.dart';
import 'package:ecommerce_crud_operation/app/core/widgets/custom_material_app.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await DevicePermissions().askForLocationAndStoragePermissions();
  runApp(
      CustomMaterialApp()
  );
}

