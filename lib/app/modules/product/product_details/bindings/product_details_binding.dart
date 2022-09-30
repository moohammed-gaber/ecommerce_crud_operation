import 'package:ecommerce_crud_operation/app/modules/product/product_details/controllers/product_details_state.dart';
import 'package:get/get.dart';

import '../controllers/product_details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsController>(
      () =>
          ProductDetailsController(ProductDetailsState.initial(Get.arguments)),
    );
  }
}
