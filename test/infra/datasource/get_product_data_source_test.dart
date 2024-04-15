import 'dart:convert';
import 'package:digi/app/core/core_export.dart';
import 'package:digi/app/domain/entity/product/product_entity.dart';
import 'package:digi/app/external/datasource/get_product/get_product_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHttp extends Mock implements IHttp {}

void main() {
  late GetProductDataSource dataSource;
  late MockHttp mockHttp;

  setUp(() {
    mockHttp = MockHttp();
    dataSource = GetProductDataSource(http: mockHttp);
  });

  group('GetProductDataSource', () {
    test('should load products from assets JSON file', () async {
      const jsonString = '''
        [{
        	"name": "hero Product",
        	"detail": "Lorem ipsum dolor sit amet",
        	"price": "99",
        	"hero": "OMG This just came out today!",
        	"image": "http://placehold.it/940x300/999/CCC"
        },{
        	"name": "Product 1",
        	"detail": "Lorem ipsum dolor sit amet",
        	"price": "99",
        	"info": "This is the latest and greatest product from Derp corp.",
        	"image": "http://placehold.it/300x300/999/CCC"
        }]
      ''';

      final List<Map<String, dynamic>> jsonList = json.decode(jsonString);
      final List<ProductEntity> productList =
          jsonList.map((json) => ProductEntity.fromJson(json)).toList();
      final HttpRequest httpRequest = HttpRequest(url: 'dummy_url');
      // when(mockHttp.get(request: anyNamed('request')))
      //     .thenAnswer((_) async => HttpResponse(data: productList, statusCode: 200));

      final result = await dataSource();

      expect(result.isSuccess, true);
      expect(result.data, isA<List<ProductEntity>>());
      expect(result.data!.length, 2);
    });

    test('should return error if failed to load products from assets JSON file',
        () async {
      final HttpRequest httpRequest = HttpRequest(url: 'dummy_url');
      final result = await dataSource();

      expect(result.isSuccess, false);
      expect(result.messageError, 'Error a consultar API');
    });
  });
}
