import 'package:dio/dio.dart';

class DioAdapterConfig {
  static void configureDio(Dio dio) {
    DioConfig.configure(dio);
  }
}
class DioConfig {
  static void configure(Dio dio) {}
}