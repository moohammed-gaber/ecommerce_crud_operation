import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';

class AllProductState {
  final AllProductsDataState allProductsDataState;

  AllProductState(this.allProductsDataState);

  // initial state
  factory AllProductState.initial() {
    return AllProductState(AllProductsDataLoadingInProgress());
  }

  // initial

  AllProductState copyWith({AllProductsDataState? allProductsDataState}) {
    return AllProductState(
      allProductsDataState ?? this.allProductsDataState,
    );
  }
}

class AllProductsDataState {}

class AllProductsDataIdle extends AllProductsDataState {}

class AllProductsDataLoadingInProgress extends AllProductsDataState {}

class AllProductsDataLoadingSuccess extends AllProductsDataState {
  final List<Product> products;

// add product

  AllProductsDataLoadingSuccess({required this.products});
}

class AllProductsDataFailure extends AllProductsDataState {}
