import 'package:ecommerce_crud_operation/app/core/value_objects/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';
import 'package:ecommerce_crud_operation/app/core/widgets/product_sizes_list.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_color/add_color_controller.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_color/add_color_state.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_product/add_product_controller.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_product/add_product_view_contract.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_size/add_size_controller.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_size/add_size_view_contract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/add_color/add_color_view_contract.dart';

class AddSizeDialog extends GetView<AddSizeController>
    implements AddSizeViewContract {
  const AddSizeDialog({Key? key}) : super(key: key);

  @override
  StatelessElement createElement() {
    controller.viewContract = this;
    return StatelessElement(this);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 80,
            child: GetBuilder<AddSizeController>(builder: (logic) {
              final state = logic.state;
              final sizes = state.sizes;
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: sizes.length,
                itemBuilder: (BuildContext context, int index) {
                  final size = sizes[index];
                  return VariationCard(
                    text: size.value.value,
                    onTap: () {
                      controller.onSelect(index);
                    },
                    isSelected: state.selectedIndex == index,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 10);
                },
              );
            }),
          ),
          ElevatedButton(
              onPressed: () {
                controller.onAdd();
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
  onSuccess(ProductSize productSize) {
    Get.back(result: productSize);
  }
}
