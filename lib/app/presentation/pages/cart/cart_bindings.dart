import 'package:digi/app/presentation/pages/cart/cart_controller.dart';
import 'package:get/get.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CartController(),
      fenix: true,
    );
  }
}
