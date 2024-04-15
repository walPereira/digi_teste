
import '../../core/utils/utils_export.dart';
import '../entity/product/product_entity.dart';

abstract class GetProductRepositoryInterface {
  Future<DataManager<List<ProductEntity>>> call();
}