
class DataManager<T> {
  final bool isSuccess;
  final T? data;
  final dynamic error;
  final String? messageError;

  DataManager._privateConstructor({
    required this.isSuccess,
    this.data,
    this.messageError,
    this.error,
  });

  factory DataManager.isSuccess({
    final T? data,
  }) {
    return DataManager._privateConstructor(
      isSuccess: true,
      data: data,
    );
  }

  factory DataManager.isError({
    String? message,
    final dynamic error,
  }) {
    return DataManager._privateConstructor(
      isSuccess: false,
      messageError: message,
      error: error,
    );
  }
}
