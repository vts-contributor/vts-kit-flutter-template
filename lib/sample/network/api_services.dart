import 'package:dio/dio.dart';
import 'package:sample/network/network.dart';
import 'package:sample/sample/models/sample.dart';
import 'sample_response_json.dart';

class SampleApiServices {
  static String baseHost = "http://10.60.110.24:8000";

  static SampleResponseJson jsonParser(Response response) =>
      SampleResponseJson.fromDioResponse(response);

  Future<List<Sample>> getSampleData() async {
    final result = await get(baseHost, "/flutter/sample.json");
    final List list = result.content['list'];
    return list.map((json) => Sample.fromJson(json)).toList();
  }
}
