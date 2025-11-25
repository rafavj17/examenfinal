class DataResponse<T> {
  final bool success;
  final String message;
  final T? data;

  DataResponse({required this.success, required this.message, this.data});

  factory DataResponse.success(T data, {String message = ''}) {
    return DataResponse(success: true, message: message, data: data);
  }

  factory DataResponse.error(String message) {
    return DataResponse(success: false, message: message, data: null);
  }
}
