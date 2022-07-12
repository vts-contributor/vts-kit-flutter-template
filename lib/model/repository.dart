import 'package:sample/model/api_services.dart';
import 'package:sample/model/user_model.dart';

class Repository {
  //TODO define function to getData and call api from ApiServices
  Future<User> requestLogin(String username, String password) =>
      ApiServices().login(username, password);
}
