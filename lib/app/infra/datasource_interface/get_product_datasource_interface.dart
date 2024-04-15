

import '../../core/core_export.dart';
import '../../domain/entity/product/product_entity.dart';

abstract class GetProductDataSourceInterface {
  Future<DataManager<List<ProductEntity>>> call();
}
