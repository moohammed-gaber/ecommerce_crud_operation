import 'package:ecommerce_crud_operation/app/core/entities/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_variant.dart';
import 'package:ecommerce_crud_operation/app/core/models/product_color_widget_model.dart';
import 'package:ecommerce_crud_operation/app/core/repos/product_repo.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_name.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_price.dart';
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
  final AddProductRepo repo;
  ProductState state;
  late final AddProductViewContract viewContract;

  AddProductController(this.state, this.repo);

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

  @override
  void onPriceChanged(ProductPrice price) {
    state = state.copyWith(price: price);
  }

  @override
  void onAddVariation() {
    state = state.addVariant();
    state = state.reset();
    viewContract.onSuccessAddVariation();
    update();
  }

  @override
  void onNameChanged(ProductName name) {
    state = state.copyWith(name: name);
  }

  @override
  void onAddProduct() {
    repo.add(state);
  }
}
