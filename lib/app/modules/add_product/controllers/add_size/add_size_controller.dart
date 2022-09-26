import 'package:ecommerce_crud_operation/app/core/entities/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/models/product_color_widget_model.dart';
import 'package:ecommerce_crud_operation/app/core/repos/product_repo.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_color/add_color_events.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_color/add_color_state.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_color/add_color_view_contract.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_product/add_product_events.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_product/add_product_state.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_product/add_product_view_contract.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_size/add_size_events.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_size/add_size_state.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_size/add_size_view_contract.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/repos/add_product_repo.dart';
import 'package:file_picker/src/platform_file.dart';
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
