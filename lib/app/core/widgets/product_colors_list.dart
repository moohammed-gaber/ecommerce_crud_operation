import 'dart:io';

import 'package:ecommerce_crud_operation/app/core/models/product_color_widget_model.dart';
import 'package:ecommerce_crud_operation/app/core/models/product_size_widget_model.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
class ProductColorList extends StatelessWidget {
  const ProductColorList({Key? key, required this.colors, required this.onTap, required this.selectedIndex}) : super(key: key);
  final List<ProductColorWidgetModel> colors;
  final Function(int index) onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (BuildContext context, int index) {
          final size = colors[index];
          return ProductColorCard(
            isSelected:selectedIndex==index ,
            productSize: size,
            onTap: () {
              onTap(index);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }
}

class ProductColorCard extends StatelessWidget {
  const ProductColorCard(
      {Key? key, required this.productSize, required this.onTap, required this.isSelected})
      : super(key: key);
  final ProductColorWidgetModel productSize;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(productSize.color.color.getOrCrash()),
/*
            Image.file(

              File(productSize.color.images.first.path!),
            ),
*/
            // CachedN(productSize.color.images.length.toString()),
          ],
        ),
      ),
    );
  }
}
