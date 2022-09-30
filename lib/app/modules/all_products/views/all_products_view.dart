import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_products_controller.dart';

class AllProductsView extends GetView<AllProductsController> {
  const AllProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AllProductsView'),
          centerTitle: true,
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.3)),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.red,
              child: Column(
                children: [
/*
                  CachedNetworkImage(
                    imageUrl: controller.pr,
                    controller.products[index].image,
                    fit: BoxFit.cover,
                  ),
                  Text(controller.products[index].name),
                  Text(controller.products[index].price.toString()),
*/
                ],
              ),
            );
          },
        ));
  }
}
