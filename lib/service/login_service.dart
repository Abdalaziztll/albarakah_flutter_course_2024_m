import 'package:dio/dio.dart';
import 'package:post_request_with_dio/config/get_it_config.dart';
import 'package:post_request_with_dio/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginService {
  Dio dio = Dio();
  late Response response;
  String baseurl = 'https://dummyjson.com/auth/login';

  Future<bool> logIn(LoginModel user);
}

class LoginServiceImp extends LoginService {
  @override
  Future<bool> logIn(LoginModel user) async {
    try {
      response = await dio.post(baseurl, data: user.toMap());
      if (response.statusCode == 200) {
        print(response);
        core
            .get<SharedPreferences>()
            .setString('token', response.data['token']);
        return true;
      } else {
        print("error");
        return false;
      }
    } on DioException catch (e) {
      print(e.message);
      return false;
    }
  }
}
