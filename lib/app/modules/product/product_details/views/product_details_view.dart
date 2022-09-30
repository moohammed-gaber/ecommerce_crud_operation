import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/modules/product/product_details/views/components/product_images.dart';
import 'package:ecommerce_crud_operation/app/modules/product/product_details/views/components/size_config.dart';
import 'package:ecommerce_crud_operation/app/modules/product/product_details/views/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  ProductDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product product = controller.state.product;

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFFEFBF9),
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                "assets/icons/Heart.svg",
                height: 20,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImages(product: product),

/*
            CachedNetworkImage(
              imageUrl: product.productColors[0].images[0],
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.cover,
            ),
*/
            const SizedBox(height: defaultPadding * 1.5),
            Container(
              padding: const EdgeInsets.fromLTRB(defaultPadding,
                  defaultPadding * 2, defaultPadding, defaultPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius * 3),
                  topRight: Radius.circular(defaultBorderRadius * 3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.productName.getOrCrash(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const SizedBox(width: defaultPadding),
                      Text(
                        "\$" +
                            product.productVariants[0].productPrice
                                .getOrCrash()
                                .toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Text(
                      "A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.",
                    ),
                  ),
                  Text(
                    "Sizes",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 80,
                    child:
                        GetBuilder<ProductDetailsController>(builder: (logic) {
                      return ListView.builder(
                        itemExtent: 80,
                        scrollDirection: Axis.horizontal,
                        itemCount: product.productSizes.length,
                        itemBuilder: (BuildContext context, int index) {
                          final size = product.productSizes[index];
                          print(size == size);
                          return VariationCard(
                            text: size.value.sign.toString(),
                            isSelected:
                                controller.state.selectedSizeIndex == index,
                            onTap: () => controller.onSelectSize(index),
                          );
                        },
                      );
                    }),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Text(
                    "Colors",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 80,
                    child:
                        GetBuilder<ProductDetailsController>(builder: (logic) {
                      return ListView.builder(
                        itemExtent: 80,
                        scrollDirection: Axis.horizontal,
                        itemCount: product.productColors.length,
                        itemBuilder: (BuildContext context, int index) {
                          final color = product.productColors[index];
                          return VariationCard(
                            text: color.color,
                            isSelected: controller.state.selectedColor == color,
                            onTap: () => controller.onSelectColor(color),
                          );
                        },
                      );
                    }),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VariationCard extends StatelessWidget {
  const VariationCard(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.isSelected})
      : super(key: key);
  final bool isSelected;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: isSelected ? Colors.orange : Colors.white,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: !isSelected ? Colors.orange : Colors.white, fontSize: 20),
        )),
      ),
    );
  }
}
