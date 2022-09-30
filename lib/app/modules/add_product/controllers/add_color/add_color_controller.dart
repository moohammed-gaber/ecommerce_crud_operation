import 'package:ecommerce_crud_operation/app/core/value_objects/product_color.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_color/add_color_events.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_color/add_color_state.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_color/add_color_view_contract.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/repos/add_product_repo.dart';
import 'package:get/get.dart';
class AddColorController extends GetxController implements AddColorEvents {
  AddColorState state;
  final AddProductRepo addProductRepo;
  late final AddColorViewContract addColorViewContract;
  AddColorController(this.state, this.addProductRepo);

  @override
  void onChangedColorTextField(ProductColorValueObject color) {
    state =
        state.copyWith(productColor: state.productColor.copyWith(color: color));
  }

  @override
  Future<void> onPickImages() async {
    final result = await addProductRepo.pickMultiImage();
    state = state.copyWith(
      productColor: state.productColor.copyWith(images: result),
    );
  }

  @override
  void onAddColor() {
    addColorViewContract.onSuccess(state.productColor);
  }
}
