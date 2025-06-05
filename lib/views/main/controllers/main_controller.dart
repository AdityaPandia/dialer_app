import 'dart:convert';

import 'package:dialer_shubbhvivah/apis/apis.dart';
import 'package:dialer_shubbhvivah/common/widgets.dart';
import 'package:dialer_shubbhvivah/views/login/models/member_model.dart';
import 'package:dialer_shubbhvivah/views/login/models/user_details_model.dart';
import 'package:dialer_shubbhvivah/views/main/models/dialer_api_model.dart';
import 'package:dialer_shubbhvivah/views/main/models/new_users_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dialerApiCall();
    dialerClientApiCall();
    fetchNewUsers();
  phoneSearchController.addListener(() {
  isPhoneSearchEmpty.value = phoneSearchController.text.isEmpty;

  if (memberModel.data == null || memberModel.data!.total == null) {
    filteredUsers.value = [];
    return;
  }

  final totalList = memberModel.data!.total!;

  if (phoneSearchController.text.trim().isNotEmpty) {
    final query = phoneSearchController.text.trim();

    final List<Total> tempFiltered = [];

    // Normalize function to strip non-digit chars for phone comparison
    String normalize(String input) => input.replaceAll(RegExp(r'\D'), '');

    final normalizedQuery = normalize(query);

    for (int i = 0; i < totalList.length; i++) {
      final user = totalList[i];
      if (user.phone != null) {
        final normalizedPhone = normalize(user.phone!);
        if (normalizedPhone.contains(normalizedQuery)) {
          tempFiltered.add(user);
        }
      }
    }

    filteredUsers.value = tempFiltered;
  } else {
    filteredUsers.value = totalList;
  }
});

    nameSearchController.addListener(() {
      isNameSearchEmpty.value = nameSearchController.text.isEmpty;
      if (nameSearchController.text.trim().isNotEmpty) {
        final query = nameSearchController.text.trim().toLowerCase();
        final List<Total> tempFiltered = [];

        for (int i = 0; i < memberModel.data!.total!.length; i++) {
          final user = memberModel.data!.total![i];
          final fullName =
              "${user.firstName ?? ''} ${user.lastName ?? ''}".toLowerCase();
          if (fullName.contains(query)) {
            tempFiltered.add(user);
          }
        }

        filteredUsers.value = tempFiltered;
      } else {
        filteredUsers.value = memberModel.data!.total!;
      }
    });
  }

  // applyNameSearch(List<String> allNames, String query) {
  //   if (query.trim().isEmpty) return;

  //   final lowerQuery = query.toLowerCase();
  //   return allNames
  //       .where((name) => name.toLowerCase().contains(lowerQuery))
  //       .toList();
  // }

  applyPhoneSearch(List<String> allNumbers, String query) {
    if (query.trim().isEmpty) return;

    // Normalize input (remove non-digit characters, like +)
    String normalize(String input) => input.replaceAll(RegExp(r'\D'), '');

    final normalizedQuery = normalize(query);

    return allNumbers.where((number) {
      final normalizedNumber = normalize(number);
      return normalizedNumber.contains(normalizedQuery);
    }).toList();
  }

  int fetchFrom = 0;
  int fetchTill = 20;
  RxInt selectedTabIndex = 0.obs;
  final List<String> tabTitles = [
    "Positive Clients",
    "Negative Clients",
    "Hot Clients",
    "Holdon Clients",
    "Closed Clients",
    "Total Followup Clients",
    "New Users",
    "Today Followup"
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

  List<String> todayPhoneStatus = [];
  List<String> yesterdayPhoneStatus = [];
  List<String> lastWeekPhoneStatus = [];

  late DialerApi dialerApiData;
  RxBool isDialerApiFetched = false.obs;
  dialerApiCall() async {
    try {
      isDialerApiFetched.value = false;
      String token = await GetStorage().read('access_token');
      var headers = {
        'Authorization': 'Bearer $token',
      };
      var dio = Dio();
      var response = await dio.request(
        'https://www.shubbhvivah.com/api/home/dialer-api',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
        dialerApiData = dialerApiFromJson(json.encode(response.data));

        todayPhoneStatus.clear();
        todayPhoneStatus
            .add(dialerApiData.data.todayCallyzerPhone.totalCalls.toString());
        todayPhoneStatus.add(formatDuration(
            dialerApiData.data.todayCallyzerPhone.totalDuration.toString()));
        todayPhoneStatus.add(dialerApiData
            .data.todayCallyzerPhone.totalIncomingCalls
            .toString());
        todayPhoneStatus.add(formatDuration(dialerApiData
            .data.todayCallyzerPhone.totalIncomingDuration
            .toString()));
        todayPhoneStatus.add(dialerApiData
            .data.todayCallyzerPhone.totalOutgoingCalls
            .toString());
        todayPhoneStatus.add(formatDuration(dialerApiData
            .data.todayCallyzerPhone.totalOutgoingDuration
            .toString()));
        todayPhoneStatus.add(
            dialerApiData.data.todayCallyzerPhone.totalMissedCalls.toString());
        todayPhoneStatus.add(dialerApiData
            .data.todayCallyzerPhone.totalRejectedCalls
            .toString());
        todayPhoneStatus.add(dialerApiData
            .data.todayCallyzerPhone.totalNeverAttendedCalls
            .toString());
        todayPhoneStatus.add(dialerApiData
            .data.todayCallyzerPhone.totalNotPickupByClientsCalls
            .toString());
        todayPhoneStatus.add(dialerApiData
            .data.todayCallyzerPhone.totalUniqueClients
            .toString());
        todayPhoneStatus.add(formatDuration(dialerApiData
            .data.todayCallyzerPhone.totalWorkingHours
            .toString()));
        todayPhoneStatus.add(dialerApiData
            .data.todayCallyzerPhone.totalConnectedCalls
            .toString());
        print(todayPhoneStatus);

        yesterdayPhoneStatus.clear();
        yesterdayPhoneStatus.add(
            dialerApiData.data.yesterdayCallyzerPhone.totalCalls.toString());
        yesterdayPhoneStatus.add(formatDuration(dialerApiData
            .data.yesterdayCallyzerPhone.totalDuration
            .toString()));
        yesterdayPhoneStatus.add(dialerApiData
            .data.yesterdayCallyzerPhone.totalIncomingCalls
            .toString());
        yesterdayPhoneStatus.add(formatDuration(dialerApiData
            .data.yesterdayCallyzerPhone.totalIncomingDuration
            .toString()));
        yesterdayPhoneStatus.add(dialerApiData
            .data.yesterdayCallyzerPhone.totalOutgoingCalls
            .toString());
        yesterdayPhoneStatus.add(formatDuration(dialerApiData
            .data.yesterdayCallyzerPhone.totalOutgoingDuration
            .toString()));
        yesterdayPhoneStatus.add(dialerApiData
            .data.yesterdayCallyzerPhone.totalMissedCalls
            .toString());
        yesterdayPhoneStatus.add(dialerApiData
            .data.yesterdayCallyzerPhone.totalRejectedCalls
            .toString());
        yesterdayPhoneStatus.add(dialerApiData
            .data.yesterdayCallyzerPhone.totalNeverAttendedCalls
            .toString());
        yesterdayPhoneStatus.add(dialerApiData
            .data.yesterdayCallyzerPhone.totalNotPickupByClientsCalls
            .toString());
        yesterdayPhoneStatus.add(dialerApiData
            .data.yesterdayCallyzerPhone.totalUniqueClients
            .toString());
        yesterdayPhoneStatus.add(formatDuration(dialerApiData
            .data.yesterdayCallyzerPhone.totalWorkingHours
            .toString()));
        yesterdayPhoneStatus.add(dialerApiData
            .data.yesterdayCallyzerPhone.totalConnectedCalls
            .toString());
        print(yesterdayPhoneStatus);

        lastWeekPhoneStatus.clear();
        lastWeekPhoneStatus.add(
            dialerApiData.data.lastweekCallyzerPhone.totalCalls.toString());
        lastWeekPhoneStatus.add(formatDuration(
            dialerApiData.data.lastweekCallyzerPhone.totalDuration.toString()));
        lastWeekPhoneStatus.add(dialerApiData
            .data.lastweekCallyzerPhone.totalIncomingCalls
            .toString());
        lastWeekPhoneStatus.add(formatDuration(dialerApiData
            .data.lastweekCallyzerPhone.totalIncomingDuration
            .toString()));
        lastWeekPhoneStatus.add(dialerApiData
            .data.lastweekCallyzerPhone.totalOutgoingCalls
            .toString());
        lastWeekPhoneStatus.add(formatDuration(dialerApiData
            .data.lastweekCallyzerPhone.totalOutgoingDuration
            .toString()));
        lastWeekPhoneStatus.add(dialerApiData
            .data.lastweekCallyzerPhone.totalMissedCalls
            .toString());
        lastWeekPhoneStatus.add(dialerApiData
            .data.lastweekCallyzerPhone.totalRejectedCalls
            .toString());
        lastWeekPhoneStatus.add(dialerApiData
            .data.lastweekCallyzerPhone.totalNeverAttendedCalls
            .toString());
        lastWeekPhoneStatus.add(dialerApiData
            .data.lastweekCallyzerPhone.totalNotPickupByClientsCalls
            .toString());
        lastWeekPhoneStatus.add(dialerApiData
            .data.lastweekCallyzerPhone.totalUniqueClients
            .toString());
        lastWeekPhoneStatus.add(formatDuration(dialerApiData
            .data.lastweekCallyzerPhone.totalWorkingHours
            .toString()));
        lastWeekPhoneStatus.add(dialerApiData
            .data.lastweekCallyzerPhone.totalConnectedCalls
            .toString());
        print(lastWeekPhoneStatus);
        isDialerApiFetched.value = true;
        // fetchAllProfiles();
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      CommonWidgets.showToast("SERVER ERROR");
    }
  }

  String formatDuration(String s) => [int.tryParse(s) ?? 0]
      .map((seconds) => [seconds ~/ 3600, (seconds % 3600) ~/ 60, seconds % 60]
          .asMap()
          .entries
          .where((e) => e.value > 0 || e.key == 2)
          .map((e) => '${e.value}${['h', 'm', 's'][e.key]}')
          .join(' '))
      .first;

  // late UserDetails fetchedUserDetails;

  // Future<bool> fetchProfile(String? uid, int memberStatus) async {
  //   try {
  //     String token = await GetStorage().read('access_token');
  //     var headers = {
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     };
  //     var dio = Dio();
  //     var response = await dio.request(
  //       'https://www.shubbhvivah.com/api/member/public-profile/$uid',
  //       options: Options(
  //         method: 'GET',
  //         headers: headers,
  //       ),
  //     );

  //     if (response.statusCode == 200) {
  //       print(json.encode(response.data));
  //       final userDetails = userDetailsFromJson(json.encode(response.data));
  //       userDetails.data.basicInfo.memberStatus = memberStatus;
  //       totalFetchedUserDetails.add(userDetails);
  //       return true;
  //     } else {
  //       print(response.statusMessage);
  //       return false;
  //     }
  //   } catch (e) {
  //     // CommonWidgets.showToast("SERVER ERROR");
  //     return false;
  //   }
  // }

  // List<UserDetails> totalFetchedUserDetails = [];

  // fetchAllProfiles() async {
  //   isAllProfilesFetched.value = false;
  //   // try {
  //   String token = await GetStorage().read('access_token');
  //   totalFetchedUserDetails.clear();
  //   for (int i = 0; i < dialerApiData.followupList.length; i++) {
  //     await fetchProfile(dialerApiData.followupList[i].userId.toString());
  //   }
  //   isAllProfilesFetched.value = true;
  //   // } catch (e) {
  //   //   isAllProfilesFetched.value = false;
  //   //   CommonWidgets.showToast("SERVER ERROR");
  //   // }
  // }

  // fetchAllProfiles(bool clearAll) async {
  //   isAllProfilesFetched.value = false;

  //   String token = await GetStorage().read('access_token');
  //   clearAll ? totalFetchedUserDetails.clear(): null;
  //   for (int i = fetchFrom; i < fetchTill; i++) {
  //     await fetchProfile(memberModel.data!.total?[i].userId.toString(),
  //         memberModel.data!.total![i].memberStatus!);
  //   }
  //   isAllProfilesFetched.value = true;
  // }

  RxBool isAllProfilesFetched = false.obs;
  late MemberModel memberModel;
  RxList<Total> filteredUsers = <Total>[].obs;
  dialerClientApiCall() async {
    // try {
    isAllProfilesFetched.value = false;
    String token = await GetStorage().read('access_token');
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var dio = Dio();
    var response = await dio.request(
      'https://www.shubbhvivah.com/api/home/dialer-api-client',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      try {
        memberModel = memberModelFromJson(json.encode(response.data));
        filteredUsers.addAll(memberModel.data!.total!);
        isAllProfilesFetched.value = true;
      } catch (e, stack) {
        print("Error during parsing: $e");
        print(stack);
        isAllProfilesFetched.value = false;
      }
    } else {
      print(response.statusMessage);
      isAllProfilesFetched.value = false;
      CommonWidgets.showToast("SERVER ERROR");
    }
  }
  // catch (e) {
  //   CommonWidgets.showToast("SERVER ERROR");
  // }

  TextEditingController nameSearchController = TextEditingController();
  TextEditingController phoneSearchController = TextEditingController();
  RxBool isNameSearchEmpty = true.obs;
  RxBool isPhoneSearchEmpty = true.obs;
}
