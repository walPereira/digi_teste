
import 'package:get/get.dart';
import 'get_product_repository.dart';
import '../../domain/repositories_interface/get_product_repository_interface.dart';


class RepositoriesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetProductRepositoryInterface>(
      () => GetProductRepository(
        getProductDataSourceInterface: Get.find(),
      ),
      fenix: true,
    );
  }
}
