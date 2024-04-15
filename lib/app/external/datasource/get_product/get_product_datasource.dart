import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../../../core/core_export.dart';
import '../../../domain/entity/product/product_entity.dart';
import '../../../infra/datasource_interface/get_product_datasource_interface.dart';


class GetProductDataSource implements GetProductDataSourceInterface {
  IHttp http;

  GetProductDataSource({required this.http});

  @override
  Future<DataManager<List<ProductEntity>>> call() async {
    try {
      String jsonString = await rootBundle.loadString('assets/products.json');
      List<dynamic> jsonList = json.decode(jsonString);
      if (jsonString.isNotEmpty) {
        Future.delayed(const Duration(seconds: 5));
        return DataManager.isSuccess(
          data:  jsonList.map((json) => ProductEntity.fromJson(json)).toList()
        );
      }
    //******************************************************************* */
      // final HttpRequest request = HttpRequest(
      //   url: "URL REQUEST HERE",
      // );

      //final HttpResponse response = await http.get(request: request);
    //******************************************************************* */

      return DataManager.isError(message: "Error a consultar API");
    } on Exception catch (e) {
      return DataManager.isError(
          message: "Error EXCEPTION  List Product ${e.toString()}");
    }
  }
}
