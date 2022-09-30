import 'package:ecommerce_crud_operation/app/core/entities/product_variant.dart';
import 'package:ecommerce_crud_operation/app/core/models/product_color_widget_model.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_name.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_price.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';

class ProductState {
  final List<ProductColorWidgetModel> productColors;
  final List<ProductSize> productSizes;
  final int selectedColorIndex;
  final int selectedSizeIndex;
  List<ProductVariant> variants;
  ProductPrice? price;
  final ProductName name;

  ProductState(this.productColors, this.selectedColorIndex, this.productSizes,
      this.selectedSizeIndex, this.variants, this.name,
      {this.price});

  // copy with
  ProductState copyWith({
    List<ProductColorWidgetModel>? productColors,
    int? selectedColorIndex,
    List<ProductSize>? productSizes,
    int? selectedSizeIndex,
    ProductPrice? price,
    List<ProductVariant>? variants,
    ProductName? name,
  }) {
    return ProductState(
      productColors ?? this.productColors,
      selectedColorIndex ?? this.selectedColorIndex,
      productSizes ?? this.productSizes,
      selectedSizeIndex ?? this.selectedSizeIndex,
      variants ?? this.variants,
      name ?? this.name,
      price: price ?? this.price,
    );
  }

  ProductState addColor(ProductColorWidgetModel productColor) {
    return copyWith(
      productColors: [...productColors, productColor],
    );
  }

  ProductState reset() {
    return copyWith(
      price: null,
      selectedColorIndex: -1,
      selectedSizeIndex: -1,
    );
  }

  ProductState addVariant() {
    return copyWith(
      variants: [
        ...variants,
        ProductVariant(
            productColor: productColors[selectedColorIndex].color.color,
            productSize: productSizes[selectedSizeIndex],
            productPrice: price!)
      ],
    );
  }

  ProductState addSize(ProductSize productSize) {
    return copyWith(
      productSizes: [...productSizes, productSize],
    );
  }

  factory ProductState.initial() {
    return ProductState([], -1, [], -1, [], ProductName(''));
  }
}
