import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/core/repos/product_repo.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_product/add_product_state.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/repos/add_product_repo.dart';
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
