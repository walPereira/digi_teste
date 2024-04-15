import 'package:digi/app/core/utils/data_manager/data_manager.dart';
import 'package:digi/app/domain/entity/product/product_entity.dart';
import 'package:digi/app/domain/repositories_interface/get_product_repository_interface.dart';
import 'package:digi/app/domain/usecase/product_usecase/get_product_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetProductRepository extends Mock
    implements GetProductRepositoryInterface {}

void main() {
  late GetProductUsecase useCase;
  late MockGetProductRepository mockRepository;

  setUp(() {
    mockRepository = MockGetProductRepository();
    useCase = GetProductUsecase(
        getProductRepository: mockRepository);
  });

  group('GetProductUseCase', () {
    test('should return list of products from repository', () async {
      final mockProducts = <ProductEntity>[
        ProductEntity(
            name: 'Product 1',
            image: 'image1.jpg',
            detail: "Lorem ipsum dolor sit amet",
            price: "99"),
        ProductEntity(
            name: 'Product 2',
            image: 'image2.jpg',
            detail: "Lorem ipsum dolor sit amet",
            price: "99")
      ];

      when(mockRepository.call())
          .thenAnswer((_) async => DataManager.isSuccess(data: mockProducts));

      final result = await useCase();

      expect(result.isSuccess, true);
      expect(result.data, mockProducts);
    });

    test('should return error from repository', () async {
      const errorMessage = 'Error fetching products';
      when(mockRepository.call())
          .thenAnswer((_) async => DataManager.isError(message: errorMessage));

      final result = await useCase();

      expect(result.isSuccess, false);
      expect(result.messageError, errorMessage);
    });
  });
}
