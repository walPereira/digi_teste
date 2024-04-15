import 'package:digi/app/core/core_export.dart';
import 'package:digi/app/domain/repositories_interface/get_product_repository_interface.dart';
import 'package:digi/app/domain/usecase/product_usecase/get_product_use_case.dart';
import 'package:digi/app/domain/usecase/usecase_interface/get_product_use_case_interface.dart';
import 'package:digi/app/external/datasource/get_product/get_product_datasource.dart';
import 'package:digi/app/infra/datasource_interface/get_product_datasource_interface.dart';
import 'package:digi/app/infra/repositories/get_product_repository.dart';
import 'package:digi/app/presentation/pages/product/product_controller.dart';
import 'package:digi/app/presentation/pages/product/product_page.dart';
import 'package:digi/app/presentation/store/get_product_store.dart';
import 'package:digi/app/presentation/utils/widgets/product/product_card_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

class MockProductController extends Mock implements ProductController {}
void main() {
  
  setUpAll(() {
    Get.lazyPut(()=>ProductController(carsStore: Get.find()));
    Get.lazyPut(()=>GetProductStore(getProductUseCaseInterface: Get.find()));
    Get.lazyPut<GetProductUseCaseInterface>(() => GetProductUsecase(getProductRepository: Get.find()));
    Get.lazyPut<GetProductRepositoryInterface>(() => GetProductRepository(getProductDataSourceInterface: Get.find()));
    Get.lazyPut<GetProductDataSourceInterface>(() => GetProductDataSource(http: Get.find()));
    Get.lazyPut<IHttp>(() => DioImpl.instance.config(Dio()));
  });

  tearDownAll(() {
    Get.delete<ProductController>();
  });

  testWidgets('ProductPage Widget Test', (WidgetTester tester) async {
    
  await tester.pumpWidget(GetMaterialApp(
    home: ProductPage(),
  ));

  await tester.pump();

  expect(find.text('Meus Produtos'), findsOneWidget);

  expect(find.byType(ProductCard), findsWidgets);

  expect(find.text('hero Product'), findsOneWidget);
  expect(find.text('Product 1'), findsOneWidget);
  expect(find.text('Product 2'), findsOneWidget);
});




}

