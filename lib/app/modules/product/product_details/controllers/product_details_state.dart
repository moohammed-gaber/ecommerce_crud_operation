import 'package:ecommerce_crud_operation/app/core/entities/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';

class ProductDetailsState {
  final int selectedSizeIndex;
  final ProductColor selectedColor;
  final Product product;

  ProductDetailsState(
      {required this.selectedSizeIndex,
      required this.selectedColor,
      required this.product});

  // copy with
  ProductDetailsState copyWith({
    int? selectedSizeIndex,
    ProductColor? selectedColor,
    Product? product,
  }) {
    return ProductDetailsState(
      selectedSizeIndex: selectedSizeIndex ?? this.selectedSizeIndex,
      selectedColor: selectedColor ?? this.selectedColor,
      product: product ?? this.product,
    );
  }

  factory ProductDetailsState.initial(Product product) {
    return ProductDetailsState(
        selectedSizeIndex: 0,
        selectedColor: product.productColors[0],
        product: product);
  }
}
