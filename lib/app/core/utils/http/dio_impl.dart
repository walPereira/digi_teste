import 'package:dio/dio.dart';

import '../utils_export.dart';

enum HttpMethodRequests {
  get,
  put,
  post,
  delete,
  patch,
}


class DioImpl implements IHttp {
  static final DioImpl _instance = DioImpl._privateConstructor();

  DioImpl._privateConstructor();

  static DioImpl get instance => _instance;

  late Dio _dio;

  DioImpl config(Dio dio) {
    _dio = dio;
    DioAdapterConfig.configureDio(_dio);
    return this;
  }



  @override
  Future<HttpResponse<T>> get<T>({
    required HttpRequest request,
    
  }) async {
    return executeRequest(
      methodRequests: HttpMethodRequests.get,
      request: request,
    );
  }

  @override
  Future<HttpResponse<T>> post<T>({
    required HttpRequest request,
  }) async {
    return executeRequest(
      methodRequests: HttpMethodRequests.post,
      request: request,
    );
  }

 
  Future<HttpResponse<T>> executeRequest<T>({
    required HttpMethodRequests methodRequests,
    required HttpRequest request,
   
  }) async {
    
    try {
      _dio.options.baseUrl = "------------------Here BASE URI Request-----------";
      _dio.options.headers["Content-Type"] = "application/json";
    
      if (request.headers != null) {
        _dio.options.headers.addAll(request.headers!);
      }
      if (methodRequests == HttpMethodRequests.get) {
        if (request.data != null) {
          throw HttpException(error: "Get don't allow body params");
        }
        final Response response = await _dio.get(
          request.url,
          queryParameters: request.queryParameters,
        );
        return _mapperResponse(response) as HttpResponse<T>;
      }

      if (methodRequests == HttpMethodRequests.post) {
        final Response response = await _dio.post(
          request.url,
          data: request.data,
          queryParameters: request.queryParameters,
        );
        return _mapperResponse(response) as HttpResponse<T>;
      }

      throw HttpException(error: "method requests not found");
    } on DioException catch (e) {
      throw HttpException(
        error: e.response.toString(),
        response: _mapperResponse(e.response),
      );
    }
  }

  HttpResponse _mapperResponse(Response? response) {
    if (response == null) {
      throw HttpException(
        response: HttpResponse(statusCode: 500),
      );
    }
    return HttpResponse(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }
}
