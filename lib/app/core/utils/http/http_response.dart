class HttpResponse<T> {
  T? data;
  int? statusCode;
  String? statusMessage;

  HttpResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
  });

  bool isSuccess() {
    return statusCode == 200 || statusCode == 201 || statusCode == 204;
  }
}
