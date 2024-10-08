import 'dart:convert';

import 'package:dialer_shubbhvivah/apis/apis.dart';
import 'package:dialer_shubbhvivah/common/widgets.dart';
import 'package:dialer_shubbhvivah/views/main/models/new_users_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchNewUsers();
    fetchTodayNewUser();
    fetchNewUploadUsers();
  }

  RxInt selectedTabIndex = 0.obs;
  final List<String> tabTitles = [
    "New Users",
    "Today's new users",
    // "New upload users"
    "New Upload",
  ];

  late NewUsersModel newUsersModel;
  RxBool isNewUsersFetched = false.obs;
  fetchNewUsers() async {
    try {
      String token = await GetStorage().read('access_token');
      var headers = {
        'Authorization': 'Bearer $token',
      };
      var dio = Dio();
      var response = await dio.request(
        Apis().fetchNewUsers,
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      newUsersModel = newUsersModelFromJson(json.encode(response.data));
      if (response.statusCode == 200) {
        print(json.encode(response.data));
        newUsersModel.result
            ? isNewUsersFetched.value = true
            : isNewUsersFetched.value = false;
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      CommonWidgets.showToast('Unable to fetch new users');
    }
  }

  late NewUsersModel todayNewUser;
  RxBool isTodayNewUserFetched = false.obs;
  fetchTodayNewUser() async {
    try {
      String token = await GetStorage().read('access_token');
      var headers = {
        'Authorization': 'Bearer $token',
      };
      var dio = Dio();
      var response = await dio.request(
        'https://shubbhvivah.com/api/today-new-followup-user',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      todayNewUser = newUsersModelFromJson(json.encode(response.data));
      if (response.statusCode == 200) {
        print(json.encode(response.data));
        todayNewUser.result
            ? isTodayNewUserFetched.value = true
            : isTodayNewUserFetched.value = false;
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      CommonWidgets.showToast('Server Error');
    }
  }

  late NewUsersModel newUploadUsersModel;
  RxBool isNewUploadUsersFetched = false.obs;
  fetchNewUploadUsers() async {
    try {
      String token = await GetStorage().read('access_token');
      var headers = {'Authorization': 'Bearer $token'};
      var data = '''''';
      var dio = Dio();
      var response = await dio.request(
        'https://shubbhvivah.com/api/new-upload-followup-user',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
        data: data,
      );
      newUploadUsersModel = newUsersModelFromJson(json.encode(response.data));
      if (response.statusCode == 200) {
        print(json.encode(response.data));
        newUploadUsersModel.result
            ? isNewUploadUsersFetched.value = true
            : isNewUploadUsersFetched.value = false;
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      CommonWidgets.showToast("SERVER ERROR");
    }
  }
}
