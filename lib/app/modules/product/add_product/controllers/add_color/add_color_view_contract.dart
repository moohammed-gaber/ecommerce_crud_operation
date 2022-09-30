import 'package:ecommerce_crud_operation/app/modules/product/add_product/controllers/add_color/add_color_state.dart';

abstract class AddColorViewContract {
  onSuccess(ProductColorInput productColorInput);

  onFailed();
}
