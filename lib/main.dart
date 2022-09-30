import 'package:ecommerce_crud_operation/app/core/device/device_permission.dart';
import 'package:ecommerce_crud_operation/app/core/widgets/custom_material_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DevicePermissions().askForLocationAndStoragePermissions();
  runApp(CustomMaterialApp());
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
