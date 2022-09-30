import 'package:ecommerce_crud_operation/app/modules/product/add_product/controllers/add_size/add_size_events.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/controllers/add_size/add_size_state.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/controllers/add_size/add_size_view_contract.dart';
import 'package:get/get.dart';

class AddSizeController extends GetxController implements AddSizeEvents {
  AddSizeState state;
  late final AddSizeViewContract viewContract;

  AddSizeController(
    this.state,
  );

  @override
  void onSelect(int index) {
    state = state.copyWith(
      selectedIndex: index,
    );
    update();
  }

  @override
  void onAdd() {
    viewContract.onSuccess(state.selectedSize);
  }
}
