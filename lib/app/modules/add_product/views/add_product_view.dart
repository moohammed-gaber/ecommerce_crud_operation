import 'package:ecommerce_crud_operation/app/core/models/product_color_widget_model.dart';
import 'package:ecommerce_crud_operation/app/core/models/product_size_widget_model.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';
import 'package:ecommerce_crud_operation/app/core/widgets/product_colors_list.dart';
import 'package:ecommerce_crud_operation/app/core/widgets/product_sizes_list.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_product/add_product_view_contract.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/views/dialogs/add_color_dialog.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/views/dialogs/add_size_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:get/get.dart';

import '../controllers/add_product/add_product_controller.dart';

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
                onPressed: () async {
                  final color = await Get.dialog(AddColorDialog());
                  controller.addColor(color);
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
                selectedIndex: controller.state.selectedColorIndex,
                colors: controller.state.productColors.toList(),
                onTap: controller.onSelectColor,
              );
            }),
            TextButton(
                onPressed: () async {
                  final size = await Get.dialog(AddSizeDialog());
                  controller.addSize(size);
                },
                child: Text('Add Size')),
            SizedBox(height: 50),
            SizedBox(
              height: 80,
              child: GetBuilder<AddProductController>(builder: (logic) {
                final state = logic.state;
                final sizes = state.productSizes;
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: sizes.length,
                  itemBuilder: (BuildContext context, int index) {
                    final size = sizes[index];
                    return VariationCard(
                      text: size.value.value,
                      onTap: () {
                        controller.onSelectSize(index);
                      },
                      isSelected: state.selectedSizeIndex == index,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 10);
                  },
                );
              }),
            ),

/*
            ProductSizesList(
              sizes: ProductSizeWidgetModel.sizes,
              onTap: controller.onTapProductColor,
            ),
*/
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
