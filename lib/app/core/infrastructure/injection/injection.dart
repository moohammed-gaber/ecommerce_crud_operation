import 'package:ecommerce_crud_operation/app/core/infrastructure/device/device_file_picker.dart';
import 'package:ecommerce_crud_operation/app/core/infrastructure/http/dio.dart';
import 'package:ecommerce_crud_operation/app/features/auth/domain/repository/auth_repo.dart';
import 'package:ecommerce_crud_operation/app/features/auth/infrastructure/data_sources/auth_local_data_source.dart';
import 'package:ecommerce_crud_operation/app/features/auth/infrastructure/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce_crud_operation/app/features/auth/infrastructure/repositories/auth_repo_impl.dart';
import 'package:ecommerce_crud_operation/app/features/product/infrastructure/mappers/add_product_mapper.dart';
import 'package:ecommerce_crud_operation/app/features/product/application/add_product/add_product/add_product_repo.dart';
import 'package:ecommerce_crud_operation/app/features/product/application/add_product/add_color/add_color_controller.dart';
import 'package:ecommerce_crud_operation/app/features/product/application/add_product/add_color/add_color_state.dart';
import 'package:ecommerce_crud_operation/app/features/product/application/add_product/add_product/add_product_controller.dart';
import 'package:ecommerce_crud_operation/app/features/product/application/add_product/add_product/add_product_state.dart';
import 'package:ecommerce_crud_operation/app/features/product/application/add_product/add_size/add_size_controller.dart';
import 'package:ecommerce_crud_operation/app/features/product/application/add_product/add_size/add_size_state.dart';
import 'package:ecommerce_crud_operation/app/features/product/application/all_products/all_product_state.dart';
import 'package:ecommerce_crud_operation/app/features/product/application/all_products/all_products_controller.dart';
import 'package:ecommerce_crud_operation/app/features/product/infrastructure/repos/product_repo_impl.dart';
import 'package:ecommerce_crud_operation/app/core/application/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class Injection extends Bindings {
  @override
  Future<void> dependencies() async {
    await GetStorage.init();
    Get.lazyPut<GetStorage>(() => GetStorage());
    Get.lazyPut<AllProductsController>(
        () => AllProductsController(
            AllProductState.initial(), Get.find<ProductRepoImpl>()),
        fenix: true);

    Get.lazyPut<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(Get.find()));
    final token = Get.find<AuthLocalDataSource>().getToken();
    final configuredDio = Get.put(ConfiguredDio(token));

    Get.lazyPut<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(configuredDio.dio));

    Get.lazyPut<AuthRepo>(() => AuthRepoImpl(Get.find(), Get.find()));
    Get.lazyPut<AppPages>(() => AppPages(Get.find()));

    Get.lazyPut(() => ProductRepoImpl(configuredDio.dio));
    Get.lazyPut(() => DeviceFilePicker(ImagePicker()));

    Get.lazyPut(() => AddProductRepo(
        Get.find<ProductRepoImpl>(), Get.find(), ProductMapper()));
    Get.lazyPut(() => AddColorController(AddColorState.initial(), Get.find()),
        fenix: true);
    Get.lazyPut(
        () => AddSizeController(
              AddSizeState.initial(),
            ),
        fenix: true);
    Get.lazyPut(
        () => AddProductController(
              ProductState.initial(),
              Get.find(),
            ),
        fenix: true);
  }
}
