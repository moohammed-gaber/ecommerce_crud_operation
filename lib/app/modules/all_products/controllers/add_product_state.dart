import 'dart:io';

import 'package:ecommerce_crud_operation/app/core/entities/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_variant.dart';
import 'package:ecommerce_crud_operation/app/core/models/product_color_widget_model.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_name.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_price.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';
import 'package:file_picker/file_picker.dart';

class AllProductState {
  final AllProductsDataState allProductsDataState;

  AllProductState(this.allProductsDataState);
  // initial state
  factory AllProductState.initial() {
    return AllProductState(AllProductsDataLoadingInProgress());
  }
}

class AllProductsDataState {}

class AllProductsDataIdle extends AllProductsDataState {}

class AllProductsDataLoadingInProgress extends AllProductsDataState {}

class AllProductsDataLoadingSuccess extends AllProductsDataState {
  final List<Product> products;

  AllProductsDataLoadingSuccess({required this.products});
}

class AllProductsDataFailure extends AllProductsDataState {}
