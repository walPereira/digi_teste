import 'package:digi/app/presentation/pages/product/product_controller.dart';
import 'package:get/get.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProductController(),
      fenix: true,
    );
  }
}