import 'package:ecommerce_crud_operation/app/core/models/product_size_widget_model.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';
import 'package:flutter/material.dart';

/*
class ProductSizesList extends StatelessWidget {
  const ProductSizesList({Key? key, required this.sizes, required this.onTap}) : super(key: key);
  final List<Size> sizes;
  final Function(int index) onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: sizes.length,
        itemBuilder: (BuildContext context, int index) {
          final size = sizes[index];
          return ProductSizeCard(
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
*/

class VariationCard extends StatelessWidget {
  const VariationCard(
      {Key? key,  required this.onTap, required this.text, required this.isSelected})
      : super(key: key);
  final String text;
  // on Tap
  final Function() onTap;
  final bool isSelected ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          // border
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text),
      ),
    );
  }
}
