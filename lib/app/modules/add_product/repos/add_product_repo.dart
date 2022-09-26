import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_crud_operation/app/core/data_sources/product_remote_data_source.dart';
import 'package:ecommerce_crud_operation/app/core/device/custom_file_picker.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/core/failures/failure.dart';
import 'package:ecommerce_crud_operation/app/core/repos/product_repo.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/controllers/add_product/add_product_state.dart';
import 'package:ecommerce_crud_operation/app/modules/add_product/mappers/add_product_mapper.dart';
import 'package:file_picker/src/platform_file.dart';
import 'package:image_picker/image_picker.dart';

class AddProductRepo {
  final CustomFilePicker filePicker;
  final ProductRepo productRepo;
  final AddProductMapper mapper;

  AddProductRepo(this.productRepo, this.filePicker, this.mapper);

  // add product
  // pick images
  Future<List<File>> pickMultiImage() {
    return filePicker.pickMultiImage();
  }

  Future<Either<Failure, Product>> add(ProductState state) async {
    return productRepo.add(mapper.productInputFromState(state));
  }
}
