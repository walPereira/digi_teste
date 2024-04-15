
import '../../../core/core_export.dart';
import '../../entity/product/product_entity.dart';

abstract class GetProductUseCaseInterface {
  Future<DataManager<List<ProductEntity>>> call();
}