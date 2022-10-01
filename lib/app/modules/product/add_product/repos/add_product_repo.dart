import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_crud_operation/app/core/device/custom_file_picker.dart';
import 'package:ecommerce_crud_operation/app/core/failures/failure.dart';
import 'package:ecommerce_crud_operation/app/modules/product/add_product/mappers/add_product_mapper.dart';
import 'package:ecommerce_crud_operation/app/modules/product/application/add_product/add_product/add_product_state.dart';
import 'package:ecommerce_crud_operation/app/modules/product/domain/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/modules/product/domain/repository/product_repo.dart';
import 'package:get/get.dart';

class AddProductRepo extends GetxService {
  final CustomFilePicker filePicker;
  final ProductRepo productRepo;
  final ProductMapper mapper;

  AddProductRepo(this.productRepo, this.filePicker, this.mapper);

  Future<List<File>> pickMultiImage() {
    return filePicker.pickMultiImage();
  }

  Future<Either<Failure, Product>> add(ProductState state) async {
    return productRepo.add(mapper.productInputFromState(state));
  }
}
