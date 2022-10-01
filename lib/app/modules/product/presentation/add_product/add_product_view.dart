import 'package:ecommerce_crud_operation/app/modules/product/domain/value_objects/product_name.dart';
import 'package:ecommerce_crud_operation/app/modules/product/domain/value_objects/product_price.dart';
import 'package:ecommerce_crud_operation/app/core/presentation/widgets/product_colors_list.dart';
import 'package:ecommerce_crud_operation/app/core/presentation/widgets/product_sizes_list.dart';
import 'package:ecommerce_crud_operation/app/modules/product/presentation/add_product/dialogs/add_color_dialog.dart';
import 'package:ecommerce_crud_operation/app/modules/product/presentation/add_product/dialogs/add_size_dialog.dart';
import 'package:ecommerce_crud_operation/app/modules/product/application/add_product/add_product/add_product_controller.dart';
import 'package:ecommerce_crud_operation/app/modules/product/application/add_product/add_product/add_product_view_contract.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddProductView extends GetView<AddProductController>
    implements AddProductViewContract {
  AddProductView({Key? key}) : super(key: key);

  // create element
  final _formKey = GlobalKey<FormState>();
  final priceController = TextEditingController();
  final nameController = TextEditingController();

  @override
  StatelessElement createElement() {
    controller.viewContract = this;
    return StatelessElement(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.onAddProduct();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('AddProductView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              controller: nameController,
              onChanged: (x) => controller.onNameChanged(ProductName((x))),
            ),
            TextButton(
                onPressed: () async {
                  Get.dialog(AddColorDialog());
                },
                child: Text('Add Color')),
            GetBuilder<AddProductController>(builder: (logic) {
              return ProductColorList(
                selectedIndex: controller.state.selectedColorIndex,
                colors: controller.state.productColors.toList(),
                onTap: controller.onSelectColor,
              );
            }),
            TextButton(
                onPressed: () async {
                  await Get.dialog(AddSizeDialog());
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
                      text: size.getOrCrash(),
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
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: priceController,
              onChanged: (x) =>
                  controller.onPriceChanged(ProductPrice(num.parse(x))),
            ),
            TextButton(
                onPressed: () async {
                  controller.onAddVariation();
                },
                child: Text('Add Variation')),
            SizedBox(
              height: 80,
              child: GetBuilder<AddProductController>(builder: (logic) {
                final state = logic.state;
                final variants = state.variants;
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: variants.length,
                  itemBuilder: (BuildContext context, int index) {
                    final variant = variants[index];
                    return VariationCard(
                      text: variant.productSize.getOrCrash() +
                          '-' +
                          variant.productPrice.getOrCrash().toString() +
                          '-' +
                          variant.productColor.getOrCrash(),
                      onTap: () {
                        controller.onTapVariantCard(index);
                      },
                      isSelected: false,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 10);
                  },
                );
              }),
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
  onSuccessAddVariation() {
    priceController.clear();
  }

  @override
  onAddProductSuccess() {
    Get.back();
  }

  @override
  Future<ProductPrice?> showVariantPriceBottomSheet() async {
    return Get.bottomSheet(VariationPriceBottomSheet());
  }

  @override
  void unFocusVariationPrice() {
    // TODO: implement unFocusVariationPrice
  }
}

class VariationPriceBottomSheet extends StatelessWidget {
  VariationPriceBottomSheet({Key? key}) : super(key: key);
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          TextField(
            focusNode: focusNode,
            controller: controller,
          ),
          TextButton(
              onPressed: () {
                focusNode.unfocus();
                Get.back(result: ProductPrice(num.parse(controller.text)));
              },
              child: Text('Save')),
        ],
      ),
    );
  }
}
