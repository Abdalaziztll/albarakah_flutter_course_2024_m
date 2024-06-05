import 'package:dio/dio.dart';
import 'package:easy_local_and_jwt_token/config/core_config.dart';
import 'package:easy_local_and_jwt_token/config/header_config.dart';
import 'package:easy_local_and_jwt_token/model/user_info_model.dart';
import 'package:easy_local_and_jwt_token/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserSerivce {
  Dio dio = Dio();

  late Response response;
  String baseurl = 'https://dummyjson.com/';

  Future<bool> logIn(UserModel user);
  Future<UserInfoModel?> getMyInfo();
}

class UserServiceImp extends UserSerivce {
  @override
  Future<bool> logIn(UserModel user) async {
    try {
      response = await dio.post(baseurl + 'auth/login', data: user.toMap()
      ,options: getHeader(useToken: false)
      );
      if (response.statusCode == 200) {
        core
            .get<SharedPreferences>()
            .setString('token', response.data['token']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<UserInfoModel?> getMyInfo() async {
    try {
      response = await dio.get(
        baseurl + 'auth/me',
        options: getHeader()
      );

      if (response.statusCode == 200) {
        UserInfoModel user = UserInfoModel.fromMap(response.data);
        core.get<SharedPreferences>().setString('offline user', user.toJson());
        return user;
      } else {
        // return UserInfoModel.fromJson(
        //     core.get<SharedPreferences>().getString('offline user')!);
        return null;
      }
    } catch (e) {
      print(e);
      // return UserInfoModel.fromJson(
      //     core.get<SharedPreferences>().getString('offline user')!);
      return null;
    }
  }
}
