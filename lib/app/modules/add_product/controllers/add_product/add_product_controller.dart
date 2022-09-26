import 'package:ecommerce_crud_operation/app/core/entities/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/models/product_color_widget_model.dart';
import 'package:ecommerce_crud_operation/app/core/repos/product_repo.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_color/add_color_state.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_color/add_color_view_contract.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_product/add_product_events.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_product/add_product_state.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_product/add_product_view_contract.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/repos/add_product_repo.dart';
import 'package:file_picker/src/platform_file.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController implements AddProductEvents {
  final AddProductRepo addProductRepo;
  AddProductState state;
  late final AddProductViewContract viewContract;
  AddColorViewContract? addColorViewContract;

  AddProductController(this.state, this.addProductRepo);

  @override
  void onSelectColor(int index) {
    state = state.copyWith(selectedColorIndex: index);
    update();
  }

  void addColor(ProductColorInput? color) {
    if (color != null) {
      state = state
          .addColor(ProductColorWidgetModel(color: color, isSelected: false));
      update();
    }
  }

  void addSize(ProductSize? size) {
    if (size != null) {
      state = state.addSize(size);
      update();
    }
  }

  @override
  void onSelectSize(int index) {
    state = state.copyWith(selectedSizeIndex: index);
    update();
  }
}
