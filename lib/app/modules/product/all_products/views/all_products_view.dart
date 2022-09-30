import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/modules/product/all_products/controllers/add_product_state.dart';
import 'package:ecommerce_crud_operation/app/modules/product/all_products/controllers/all_product_view_contract.dart';
import 'package:ecommerce_crud_operation/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/all_products_controller.dart';

class AllProductsView extends GetView<AllProductsController>
    implements AllProductViewContract {
  const AllProductsView({Key? key}) : super(key: key);

  @override
  StatelessElement createElement() {
    // TODO: implement createElement
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
/*
    Get.find<AllProductsController>();
    controller.repo.getAll().then((value) => print('value: ${value.length()}'));
    return SizedBox();
*/
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: navigateToAddProduct,
        ),
        appBar: AppBar(
          title: const Text('AllProductsView'),
          centerTitle: true,
        ),
        body: GetBuilder<AllProductsController>(builder: (logic) {
          final state = logic.state.allProductsDataState;
          if (state is AllProductsDataLoadingInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AllProductsDataFailure) {
            return Center(
              child: Text('Something went wrong'),
            );
          }
          if (state is AllProductsDataLoadingSuccess) {
            final products = state.products;
            return GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.3)),
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return InkWell(
                  onTap: () =>
                      Get.toNamed(Routes.PRODUCT_DETAILS, arguments: product),
                  child: Card(
                    color: Colors.red,
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: product.productColors[0].images[0],
                          fit: BoxFit.cover,
                        ),
                        Text(product.productName.getOrCrash()),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return SizedBox();
        }));
  }

  @override
  Future<Product?> navigateToAddProduct() async {
    final product = await Get.toNamed(Routes.ADD_PRODUCT);
    return product;
  }

  @override
  onAddProductFailed() {
    // TODO: implement onAddProductFailed
    throw UnimplementedError();
  }

  @override
  onAddProductSuccess() {
    // TODO: implement onAddProductSuccess
    throw UnimplementedError();
  }

  @override
  onSuccessAddVariation() {
    // TODO: implement onSuccessAddVariation
    throw UnimplementedError();
  }
}
