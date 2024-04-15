import 'package:get/get.dart';
import '../../../core/core_export.dart';
import '../../../domain/entity/cart_item/cart_item_entity.dart';
import '../../../domain/entity/product/product_entity.dart';
import '../../store/get_product_store.dart';

class ProductController extends GetxController {
  final GetProductStore carsStore;

  ProductController({required this.carsStore});

  RxList<CartItem> itens = RxList.empty();
  RxList<ProductEntity> productItens = RxList.empty();

  @override
  void onInit() {
    super.onInit();
    carsStore.getProducts();
  }

  void navigate() {
    Get.toNamed(
      AppRouter.cartPage,
      arguments: {
        "items": itens,
      },
    );
  }

  void addItem(ProductEntity product) {
    bool found = false;
    productItens.add(product);
    for (var item in itens) {
      if (item.product.name == product.name) {
        item.quantity++;
        found = true;
        break;
      }
    }
    if (!found) {
      itens.add(CartItem(product: product));
    }
  }
}
