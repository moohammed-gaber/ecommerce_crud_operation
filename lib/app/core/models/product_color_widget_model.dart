import 'package:ecommerce_crud_operation/app/modules/product/application/add_product/add_color/add_color_state.dart';

class ProductColorWidgetModel {
  final ProductColorInput color;

  ProductColorWidgetModel({
    required this.color,
  });

  ProductColorWidgetModel copyWith({bool? isSelected}) {
    return ProductColorWidgetModel(
      color: this.color,
    );
  }
}
