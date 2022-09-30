import 'package:ecommerce_crud_operation/app/modules/product/add_product/controllers/add_product/add_product_state.dart';
import 'package:get/get.dart';

import '../controllers/add_product/add_product_controller.dart';

class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProductController>(
      () => AddProductController(ProductState.initial(), Get.find()),
    );
  }
}
