
import '../utils_export.dart';

enum ErrorType {
  noConnection,
  connectTimeout,
  sendTimeOut,
  receiveTimeout,
  response,
  cancel,
  DEFAULT,
}

class HttpException implements Exception {
  HttpResponse? response;
  ErrorType type;
  String? error;

  String get message => (error ?? '{}').toString();

  HttpException({
    this.response,
    this.type = ErrorType.DEFAULT,
    this.error,
  });

  @override
  String toString() {
    return 'HttpException{response: $response, type: $type, error: $error}';
  }
}
