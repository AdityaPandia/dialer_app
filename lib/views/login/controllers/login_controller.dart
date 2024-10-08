import 'dart:convert';

import 'package:dialer_shubbhvivah/apis/apis.dart';
import 'package:dialer_shubbhvivah/common/widgets.dart';
import 'package:dialer_shubbhvivah/views/login/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  late LoginModel loginModel;

  Future<bool> login() async {
    try {
      var data = FormData.fromMap({
        'email_or_phone': emailController.text,
        'password': passController.text
      });

      var dio = Dio();
      var response = await dio.request(
        Apis().login,
        options: Options(
          method: 'POST',
        ),
        data: data,
      );
      loginModel = loginModelFromJson(json.encode(response.data));
      if (response.statusCode == 200) {
        print(json.encode(response.data));
        if (loginModel.result) {
          await GetStorage().write('access_token', loginModel.accessToken);
          await GetStorage().write('isLoggedIn', true);
          return true;
        } else {
          return false;
        }
      } else {
        print(response.statusMessage);
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
