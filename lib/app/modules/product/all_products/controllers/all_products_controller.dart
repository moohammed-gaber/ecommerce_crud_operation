import 'package:ecommerce_crud_operation/app/core/entities/product_variant.dart';
import 'package:ecommerce_crud_operation/app/core/repos/product_repo.dart';
import 'package:ecommerce_crud_operation/app/modules/product/all_products/controllers/add_product_state.dart';
import 'package:ecommerce_crud_operation/app/modules/product/all_products/controllers/all_product_events.dart';
import 'package:ecommerce_crud_operation/app/modules/product/all_products/controllers/all_product_view_contract.dart';
import 'package:get/get.dart';

class AllProductsController extends GetxController implements AllProductEvents {
  AllProductState state;
  final ProductRepo repo;
  late final AllProductViewContract viewContract;

  AllProductsController(this.state, this.repo);

  Future<void> getAllProducts() async {
    state = state.copyWith(
        allProductsDataState: AllProductsDataLoadingInProgress());
    update();
    final products = await repo.getAll();
    state = state.copyWith(
        allProductsDataState: products.fold((l) => AllProductsDataFailure(),
            (r) => AllProductsDataLoadingSuccess(products: r)));
    update();
  }

  @override
  void onInit() {
    super.onInit();

    getAllProducts();
  }

  @override
  Future<void> onTapAddProduct() async {
    final result = await viewContract.navigateToAddProduct();
    if (result != null) {
      state = state.copyWith(
          allProductsDataState: AllProductsDataLoadingSuccess(products: [
        ...(state.allProductsDataState as AllProductsDataLoadingSuccess)
            .products,
        result
      ]));
      update();
    }
  }

  @override
  void onTapProductCard() {
    // TODO: implement onTapProductCard
  }

  @override
  void onTapVariantCard(ProductVariant variant) {}
}
