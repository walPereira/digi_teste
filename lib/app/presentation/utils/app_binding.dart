import 'package:get/get.dart';

import '../../domain/usecase/usecases_binding.dart';
import '../../external/datasources_binding.dart';
import '../../infra/repositories/repositories_bindings.dart';
import '../store/get_product_store.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    DatasourcesBindings().dependencies();
    RepositoriesBindings().dependencies();
    UsecasesBindings().dependencies();

    Get.lazyPut<GetProductStore>(
      () => GetProductStore(
        getProductUseCaseInterface: Get.find(),
      ),
      fenix: true,
    );
  }
  
}
