import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/modules/product/product_details/controllers/product_details_controller.dart';
import 'package:ecommerce_crud_operation/app/modules/product/product_details/views/components/size_config.dart';
import 'package:ecommerce_crud_operation/app/modules/product/product_details/views/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  final controller = Get.find<ProductDetailsController>();

  @override
  Widget build(BuildContext context) {
    print(widget.product.productColors);
    print(widget.product.productVariants[0]);
    print(widget.product.productVariants[0]);
    return Column(
      children: [
        GetBuilder<ProductDetailsController>(builder: (logic) {
          return CarouselSlider(
            options: CarouselOptions(height: 300.0, viewportFraction: 1),
            items: widget
                .product.productColors[controller.state.selectedColor].images
                .map((i) {
              return CachedNetworkImage(
                imageUrl: i,
                fit: BoxFit.contain,
                height: 20,
              );
            }).toList(),
          );
        }),

/*
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.product.id.toString(),
              child: CachedNetworkImage(
                  imageUrl: widget.product.productColors[0].images[0]),
            ),
          ),
        ),
*/
        // SizedBox(height: getProportionateScreenWidth(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.product.productColors[0].images
              .map((e) => buildSmallProductPreview(e))
              .toList(),
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(String image) {
    // print(index);
    return GestureDetector(
      onTap: () {
        setState(() {
          // selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
/*
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
*/
        ),
        child: CachedNetworkImage(imageUrl: image),
      ),
    );
  }
}
