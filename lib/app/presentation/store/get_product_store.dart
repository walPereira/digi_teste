import 'package:get/state_manager.dart';
import '../../core/core_export.dart';
import '../../domain/entity/product/product_entity.dart';
import '../../domain/usecase/usecase_interface/get_product_use_case_interface.dart';

class GetProductStore extends GetxController {
  final GetProductUseCaseInterface getProductUseCaseInterface;

  GetProductStore({required this.getProductUseCaseInterface});

  Rx<StatePage<List<ProductEntity>>> state = Rx(StateLoading());

  void getProducts() async {
    state.value = StateLoading();
    final DataManager<List<ProductEntity>> dataManager =
        await getProductUseCaseInterface();

    if (dataManager.isSuccess) {
      state.value = StateSuccess(data: dataManager.data);
      return;
    }

    state.value = StateError(message: dataManager.messageError);
  }
}