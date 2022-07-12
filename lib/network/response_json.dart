import 'package:dio/dio.dart';
import 'package:flutter_core/network/response_json.dart';

class AppResponseJson extends JsonResponse {
  AppResponseJson({content, errorCode, errorMessage})
      : super(
            content: content, errorCode: errorCode, errorMessage: errorMessage);

  factory AppResponseJson.fromResponse(Response response) {
    AppResponseJson responseJson = AppResponseJson();
    //TODO parse json
    try {
      if (response.statusCode == 401) {
        //unauthorized response
        responseJson = AppResponseJson(errorCode: response.statusCode);
      } else {
        final Map<String, dynamic> bodyJson = response.data;
        responseJson = AppResponseJson(
          content: bodyJson,
        );
      }
    } catch (err) {
      responseJson = AppResponseJson(
          errorCode: response.statusCode, errorMessage: response.data);
    }
    return responseJson;
  }
}
