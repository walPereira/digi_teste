import '../../core/core_export.dart';
import '../../domain/entity/product/product_entity.dart';
import '../../domain/repositories_interface/get_product_repository_interface.dart';
import '../datasource_interface/get_product_datasource_interface.dart';

class GetProductRepository implements GetProductRepositoryInterface {
  final GetProductDataSourceInterface getProductDataSourceInterface;

  GetProductRepository({
    required this.getProductDataSourceInterface,
  });

  @override
  Future<DataManager<List<ProductEntity>>> call() async {    
    return await getProductDataSourceInterface();
  }
}