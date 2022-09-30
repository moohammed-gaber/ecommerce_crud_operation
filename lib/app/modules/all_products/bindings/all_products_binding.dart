import 'package:ecommerce_crud_operation/app/modules/all_products/controllers/add_product_state.dart';
import 'package:get/get.dart';

import '../controllers/all_products_controller.dart';

class AllProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllProductsController>(
      () => AllProductsController(AllProductState.initial()),
    );
  }
}
