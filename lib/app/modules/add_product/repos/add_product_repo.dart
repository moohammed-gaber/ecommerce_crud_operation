import 'package:dartz/dartz.dart';
import 'package:ecommerce_crud_operation/app/core/data_sources/product_remote_data_source.dart';
import 'package:ecommerce_crud_operation/app/core/device/custom_file_picker.dart';
import 'package:ecommerce_crud_operation/app/core/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/core/failures/failure.dart';
import 'package:ecommerce_crud_operation/app/core/repos/product_repo.dart';
import 'package:file_picker/src/platform_file.dart';

class AddProductRepo {
  final CustomFilePicker filePicker;
  final ProductRepo productRepo;

  AddProductRepo(this.productRepo, this.filePicker);

  // add product
  // pick images
  Future<List<PlatformFile>> pickMultiImage() {
    return filePicker.pickMultiImage();
  }

  Future<Either<Failure, Product>> add(Product product) async {
/*
    if (images.isEmpty) {
      return Left(Failure());
    }
*/
    return productRepo.add(product);
  }
}
