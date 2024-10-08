import 'package:dialer_shubbhvivah/common/widgets.dart';
import 'package:dialer_shubbhvivah/views/main/controllers/main_controller.dart';
import 'package:dialer_shubbhvivah/views/main/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TodayNewUsersView extends StatelessWidget {
 TodayNewUsersView({super.key});
  final controller = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isTodayNewUserFetched.value
        ? controller.todayNewUser.data.isNotEmpty
            ? Column(
                children: [
                  for (int i = 0;
                      i < controller.todayNewUser.data.length;
                      i++) ...[
                    NewUserContainer(
                        onTap: () {
                          var url = Uri.parse(
                              "tel:${controller.todayNewUser.data[i].phone}");
                          launchUrl(url);
                        },
                        name: controller.todayNewUser.data[i].name,
                        phoneNum: controller.todayNewUser.data[i].phone)
                  ]
                ],
              )
            : Text("NO DATA")
        : CommonWidgets.commonLoader); 
  }
}
