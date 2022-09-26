import 'package:ecommerce_crud_operation/app/core/value_objects/product_color.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_color/add_color_controller.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_color/add_color_state.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_product/add_product_controller.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_product/add_product_view_contract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/add_color/add_color_view_contract.dart';

class AddColorDialog extends GetView<AddColorController>
    implements AddColorViewContract {

   AddColorDialog({Key? key}) : super(key: key);
  @override
  StatelessElement createElement() {
    controller.addColorViewContract = this;
    return StatelessElement(this);
  }

  @override
  Widget build(BuildContext context) {

    return Dialog(
      child: SingleChildScrollView(
          child: Column(
        children: [
          TextField(
            onChanged: (value) {
              controller
                  .onChangedColorTextField(ProductColorValueObject(value));
            },
          ),
          ElevatedButton(
              onPressed: () {
                controller.onPickImages();
              },
              child: Text('Select images')),
          ElevatedButton(
              onPressed: () {
                controller.onAddColor();
              },
              child: Text('Done'))
        ],
      )),
    );
  }


  @override
  onFailed() {
    Get.snackbar('Error', 'Failed to add product');
  }

  @override
  onSuccess(ProductColorInput productColorInput) {
    Get.back(result: productColorInput);
  }

}
