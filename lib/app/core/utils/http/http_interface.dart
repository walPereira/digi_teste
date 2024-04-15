
import '../utils_export.dart';

abstract class IHttp {
  Future<HttpResponse<T>> get<T>({
    required HttpRequest request,   
  });

  Future<HttpResponse<T>> post<T>({
    required HttpRequest request,
  });

}
