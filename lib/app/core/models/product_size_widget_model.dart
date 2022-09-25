import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';

class ProductSizeWidgetModel {
  static final sizes = ProductSize.sizes
      .map((e) => ProductSizeWidgetModel(size: e, isSelected: false)).toList();
  final ProductSize size;
  final bool isSelected;
  ProductSizeWidgetModel({required this.size, this.isSelected = false});
  // copy with is selected
  ProductSizeWidgetModel copyWith({bool? isSelected}) {
    return ProductSizeWidgetModel(
      size: this.size,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
