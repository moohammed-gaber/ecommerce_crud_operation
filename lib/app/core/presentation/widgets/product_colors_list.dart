import 'dart:io';

import 'package:ecommerce_crud_operation/app/modules/product/application/add_product/add_color/add_color_state.dart';
import 'package:flutter/material.dart';

class ProductColorList extends StatelessWidget {
  const ProductColorList(
      {Key? key,
      required this.colors,
      required this.onTap,
      required this.selectedIndex})
      : super(key: key);
  final List<ProductColorInput> colors;
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
            isSelected: selectedIndex == index,
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
      {Key? key,
      required this.productSize,
      required this.onTap,
      required this.isSelected})
      : super(key: key);
  final ProductColorInput productSize;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(productSize.color.getOrCrash()),
            Image.file(
              File(
                productSize.images.first.path,
              ),
              height: 50,
              width: 50,
            ),
            // CachedN(productSize.color.images.length.toString()),
          ],
        ),
      ),
    );
  }
}
