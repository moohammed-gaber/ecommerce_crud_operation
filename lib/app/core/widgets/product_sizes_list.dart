import 'package:ecommerce_crud_operation/app/core/models/product_size_widget_model.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';
import 'package:flutter/material.dart';

class ProductSizesList extends StatelessWidget {
  const ProductSizesList({Key? key, required this.sizes, required this.onTap}) : super(key: key);
  final List<ProductSizeWidgetModel> sizes;
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

class ProductSizeCard extends StatelessWidget {
  const ProductSizeCard(
      {Key? key, required this.productSize, required this.onTap})
      : super(key: key);
  final ProductSizeWidgetModel productSize;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: productSize.isSelected ? Colors.black : Colors.white,
          border: Border.all(
            color: productSize.isSelected ? Colors.black : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(productSize.size.value.value),
      ),
    );
  }
}
