import 'package:dio/dio.dart';
import 'package:easy_local_and_jwt_token/config/core_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

Options getHeader({bool useToken = true}) {
  if (useToken) {
    return Options(
      headers: {
        'Authorization':
            "Bearer ${core.get<SharedPreferences>().getString('token')}",
      },
    );
  } else {
    return Options(
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }
}
