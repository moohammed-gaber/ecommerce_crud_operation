import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';

class AddSizeState {
  final sizes = ProductSize.sizes;

  ProductSize get selectedSize => sizes[selectedIndex];
  final int selectedIndex;

  AddSizeState(this.selectedIndex);

  // initial
  factory AddSizeState.initial() => AddSizeState(-1);

  // copyWith
  AddSizeState copyWith({
    int? selectedIndex,
  }) {
    return AddSizeState(
      selectedIndex ?? this.selectedIndex,
    );
  }
}
