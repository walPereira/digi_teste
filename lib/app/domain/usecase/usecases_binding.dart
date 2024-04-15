import 'package:digi/app/domain/usecase/product_usecase/get_product_use_case.dart';
import 'package:get/get.dart';
import 'usecase_interface/get_product_use_case_interface.dart';

class UsecasesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetProductUseCaseInterface>(
      () => GetProductUsecase(
        getProductRepository: Get.find(),
      ),
      fenix: true,
    );
  }
}
