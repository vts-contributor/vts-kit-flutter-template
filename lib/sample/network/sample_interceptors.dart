part of 'sample_network.dart';

InterceptorsWrapper get interceptors =>
    InterceptorsWrapper(onRequest: onRequestHandle, onError: onErrorHandle);

void onRequestHandle(
    RequestOptions options, RequestInterceptorHandler handler) {
  if (!options.headers.containsKey(Headers.contentTypeHeader)) {
    options.headers[Headers.contentTypeHeader] = Headers.jsonContentType;
  }
  options.headers['authorization'] = '${Profile.token?.type} ${Profile.token?.access}';
  handler.next(options);
}

void onErrorHandle(DioError error, ErrorInterceptorHandler handler) async {
  final response = error.response;
  if (response != null) {
    // TODO handle 403 error
    if (response.statusCode == 403) {

    } else {
      //chuyển error của dio thành ServerResponseError để lấy message từ server
      final json = jsonDecode(error.response?.data);
      final err = json['message'];
      error.error = ServerResponseError(err);
    }
  }
  handler.next(error);
}
