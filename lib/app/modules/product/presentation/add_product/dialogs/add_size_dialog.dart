import 'package:ecommerce_crud_operation/app/modules/product/domain/value_objects/product_size.dart';
import 'package:ecommerce_crud_operation/app/core/presentation/widgets/product_sizes_list.dart';
import 'package:ecommerce_crud_operation/app/modules/product/application/add_product/add_product/add_product_controller.dart';
import 'package:ecommerce_crud_operation/app/modules/product/application/add_product/add_size/add_size_controller.dart';
import 'package:ecommerce_crud_operation/app/modules/product/application/add_product/add_size/add_size_view_contract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSizeDialog extends GetView<AddSizeController>
    implements AddSizeViewContract {
  AddSizeDialog({Key? key}) : super(key: key);

  @override
  StatelessElement createElement() {
    controller.viewContract = this;
    return StatelessElement(this);
  }

  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
          child: Column(
        children: [
/*
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
*/

          TextField(
            controller: textEditingController,
            onChanged: (_) => controller.onChangeSizeTextField(ProductSize(_)),
          ),
          ElevatedButton(
              onPressed: () {
                controller.onTapAddSizeButton();
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
  onSizeAdded(ProductSize productSize) {
    Get.find<AddProductController>().addSize(productSize);
    textEditingController.clear();
  }
}
