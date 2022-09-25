import 'package:ecommerce_crud_operation/app/core/entities/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_product_state.dart';

class ProductColorWidgetModel {
  final ProductColorInput color;
  final bool isSelected;
  ProductColorWidgetModel({required this.color, this.isSelected = false});
  // copy with is selected
  ProductColorWidgetModel copyWith({bool? isSelected}) {
    return ProductColorWidgetModel(
      color: this.color,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
