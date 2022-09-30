import 'package:ecommerce_crud_operation/app/core/entities/product_color.dart';
import 'package:ecommerce_crud_operation/app/modules/product/product_details/controllers/product_details_events.dart';
import 'package:ecommerce_crud_operation/app/modules/product/product_details/controllers/product_details_state.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController
    implements ProductDetailsEvents {
  ProductDetailsState state;

  ProductDetailsController(this.state);

  @override
  void onSelectColor(ProductColor color) {
    state = state.copyWith(
      selectedColor: color,
    );
    update();
    // update(['color']);
  }

  @override
  void onSelectSize(int index) {
    state = state.copyWith(selectedSizeIndex: index);
    update();
  }
}
