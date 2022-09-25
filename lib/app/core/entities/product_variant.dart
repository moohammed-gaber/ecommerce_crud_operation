import 'package:ecommerce_crud_operation/app/core/entities/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_price.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';

class ProductVariant{
  final ProductColor productColor;
  final ProductSize productSize;
  final ProductPrice productPrice;
  final String id;

  ProductVariant(this.productColor, this.productSize, this.id, this.productPrice);



}