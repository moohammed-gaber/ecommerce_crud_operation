import 'package:ecommerce_crud_operation/app/core/entities/product_color.dart';

abstract class ProductDetailsEvents {
  void onSelectSize(int index);

  void onSelectColor(ProductColor color);
}
