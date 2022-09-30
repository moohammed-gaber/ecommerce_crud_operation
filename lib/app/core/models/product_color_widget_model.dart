import 'package:ecommerce_crud_operation/app/modules/product/add_product/controllers/add_color/add_color_state.dart';

class ProductColorWidgetModel {
  final ProductColorInput color;
  final bool isSelected;

  ProductColorWidgetModel({required this.color, this.isSelected = false});

  ProductColorWidgetModel copyWith({bool? isSelected}) {
    return ProductColorWidgetModel(
      color: this.color,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
