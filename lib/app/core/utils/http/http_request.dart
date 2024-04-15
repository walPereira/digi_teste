class HttpRequest {
  final String url;
  final String? customBaseUrl;
  final dynamic data;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;
  final bool showLog;

  HttpRequest({
    required this.url,
    this.customBaseUrl,
    this.data,
    this.queryParameters,
    this.headers,
    this.showLog = true,
  }) : assert(url.isNotEmpty);
}
