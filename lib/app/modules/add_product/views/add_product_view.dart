import 'package:ecommerce_crud_operation/app/core/models/product_color_widget_model.dart';
import 'package:ecommerce_crud_operation/app/core/models/product_size_widget_model.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';
import 'package:ecommerce_crud_operation/app/core/widgets/product_colors_list.dart';
import 'package:ecommerce_crud_operation/app/core/widgets/product_sizes_list.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_product_view_contract.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/views/dialogs/add_color_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController>
    implements AddProductViewContract {
  AddProductView({Key? key}) : super(key: key);

  // create element
  final _formKey = GlobalKey<FormState>();

  @override
  StatelessElement createElement() {
    controller.viewContract = this;
    return StatelessElement(this);
  }

  @override
  Widget build(BuildContext context) {
    Color pickerColor = Color(0xff443a49);
    Color currentColor = Color(0xff443a49);
// print(controller.addProductState.productColor.color.getOrCrash());
// ValueChanged<Color> callback
    void changeColor(Color color) {
      pickerColor = color;
      print(pickerColor);
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('AddProductView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  Get.dialog(AddColorDialog());
                },
                child: Text('Add Color')),

/*
            ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
            ),
*/
            GetBuilder<AddProductController>(builder: (logic) {
              return ProductColorList(
                selectedIndex: controller.addProductState.selectedColorIndex,
                colors: controller.addProductState.productColors.toList(),
                onTap: controller.onTapProductColor,
              );
            }),
            SizedBox(height: 50),
            ProductSizesList(
              sizes: ProductSizeWidgetModel.sizes,
              onTap: controller.onTapProductColor,
            ),
          ],
        ),
        // Use Material color picker:
        //
      ),
    );
  }

  @override
  onAddProductFailed() {
    Get.snackbar('Error', 'Failed to add product');
  }

  @override
  onAddProductSuccess() {
    Get.back();
  }
}
