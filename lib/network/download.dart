import 'dart:io';

import 'package:dio/dio.dart';
import 'dio_network.dart' as dio_network;

Future<File> download(String url, String savePath,
        {CancelToken? cancelToken, ProgressCallback? onReceiveProgress}) =>
    dio_network.download(url, savePath,
        cancelToken: cancelToken, onReceiveProgress: onReceiveProgress);
