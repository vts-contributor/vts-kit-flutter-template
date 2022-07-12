import 'package:dio/dio.dart';
import 'package:flutter_core/network/response_json.dart';

class SampleResponseJson extends JsonResponse {
  SampleResponseJson({content, errorCode, errorMessage})
      : super(
            content: content, errorCode: errorCode, errorMessage: errorMessage);

  factory SampleResponseJson.fromLoginResponse(Response response) {
    SampleResponseJson responseJson;
    try {
      if (response.statusCode == 401) {
        //unauthorized response
        responseJson = SampleResponseJson(errorCode: response.statusCode);
      } else {
        final Map<String, dynamic> bodyJson = response.data;
        if (bodyJson.containsKey('data')) {
          responseJson = SampleResponseJson(
              content: bodyJson['data'],
              errorCode: response.statusCode,
              errorMessage: response.statusMessage);
        } else {
          String? errorCode, errorMessage;
          if (bodyJson.containsKey('error')) {
            final errorJson = bodyJson['error'];
            errorCode = errorJson['code'];
            errorMessage = errorJson['message'];
          }
          responseJson = SampleResponseJson(
              content: bodyJson,
              errorCode: errorCode,
              errorMessage: errorMessage);
        }
      }
    } catch (err) {
      responseJson = SampleResponseJson(
          errorCode: response.statusCode, errorMessage: response.data);
    }
    return responseJson;
  }

  factory SampleResponseJson.fromDioResponse(Response response) {
    SampleResponseJson responseJson;
    try {
      if (response.statusCode == 401) {
        //unauthorized response
        responseJson = SampleResponseJson(errorCode: response.statusCode);
      } else {
        final Map<String, dynamic> bodyJson = response.data;
        if (bodyJson.containsKey('data')) {
          responseJson = SampleResponseJson(
              content: bodyJson['data'],
              errorCode: response.statusCode,
              errorMessage: response.statusMessage);
        } else {
          String? errorCode, errorMessage;
          if (bodyJson.containsKey('error')) {
            final errorJson = bodyJson['error'];
            errorCode = errorJson['statusCode'];
            errorMessage = errorJson['statusMessage'];
          }
          responseJson = SampleResponseJson(
              content: bodyJson,
              errorCode: errorCode,
              errorMessage: errorMessage);
        }
      }
    } catch (err) {
      responseJson = SampleResponseJson(
          errorCode: response.statusCode, errorMessage: response.data);
    }
    return responseJson;
  }

  @override
  String toString() =>
      'content: $content, errorCode: $errorCode, errorMessage: $errorMessage';
}
