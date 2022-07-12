import 'package:sample/model/user_model.dart';
import 'package:sample/network/response_json.dart';
import 'package:sample/network/network.dart';
import 'package:dio/dio.dart';

class ApiServices {
  static String baseHost = "http://10.30.176.147:8088";

  static AppResponseJson jsonParser(Response response) =>
      AppResponseJson.fromResponse(response);

  Future<User> login(String username, String password) async {
    var response;
    try {
      response = await post(baseHost, 'testLogin',
          {'username': "$username", 'password': "$password"});
    } catch (e) {
      print(e);
    }

    final data = response.content;
    return User.fromJson(data);
    return data.map((json) => User.fromJson(json));
    // return User.fromJson(response);

//TODO define function to get data, use get/post from network
  }
}
