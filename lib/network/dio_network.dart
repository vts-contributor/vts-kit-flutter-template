import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_core/caches/caches.dart';

import 'api_service.dart';
import 'response_json.dart';

part 'dio_interceptors.dart';

Future<V> get<V extends JsonResponse>(
  String host,
  String path, {
  Map<String, String>? headers,
  CancelToken? cancelToken,
  Map<String, dynamic>? params,
  InterceptorsWrapper? customInterceptors,
  required Function(Response res) parser,
}) async {
  final dio = prepareDio(interceptors: customInterceptors ?? interceptors);
  final response = await dio.get(
    '$host/$path',
    queryParameters: params,
    cancelToken: cancelToken,
    options: Options(headers: headers),
  );
  return parser(response);
}

Future<V> post<V extends JsonResponse>(
  String host,
  String path,
  dynamic body, {
  Map<String, String>? headers,
  CancelToken? cancelToken,
  InterceptorsWrapper? customInterceptors,
  required Function(Response res) parser,
}) async {
  final dio = prepareDio(interceptors: customInterceptors ?? interceptors);
  final response = await dio.post(
    '$host/$path',
    data: body,
    cancelToken: cancelToken,
    options: Options(headers: headers),
  );
  return parser(response);
}

Future<File> download(
  String url,
  String savePath, {
  CancelToken? cancelToken,
  ProgressCallback? onReceiveProgress,
  InterceptorsWrapper? customInterceptors,
}) async {
  final dio = prepareDio(interceptors: customInterceptors ?? interceptors);
  await dio.download(
    url,
    savePath,
    cancelToken: cancelToken,
    onReceiveProgress: onReceiveProgress,
  );
  File file = File(savePath);
  return file;
}

Dio prepareDio({required InterceptorsWrapper interceptors}) {
  final dio = Dio()..interceptors.add(interceptors);
  return dio;
}
