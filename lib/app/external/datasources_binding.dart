import 'package:digi/app/external/datasource/get_product/get_product_datasource.dart';
import 'package:get/get.dart';
import '../infra/datasource_interface/get_product_datasource_interface.dart';

class DatasourcesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetProductDataSourceInterface>(
      () => GetProductDataSource(http: Get.find()),
      fenix: true,
    );
  }
}
