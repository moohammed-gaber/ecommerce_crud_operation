import 'package:ecommerce_crud_operation/app/modules/product/domain/value_objects/product_color.dart';

class ProductColor {
  final List<String> images;
  final ProductColorValueObject color;

  ProductColor(this.images, this.color);
}
