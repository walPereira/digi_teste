

import '../../../core/core_export.dart';
import '../../entity/product/product_entity.dart';
import '../../repositories_interface/get_product_repository_interface.dart';
import '../usecase_interface/get_product_use_case_interface.dart';

class GetProductUsecase implements GetProductUseCaseInterface {
  final GetProductRepositoryInterface getProductRepository;

  GetProductUsecase({required this.getProductRepository});

  @override
  Future<DataManager<List<ProductEntity>>> call() async {
    return await getProductRepository();
  }
}