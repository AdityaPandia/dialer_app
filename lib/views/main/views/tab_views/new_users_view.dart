import 'package:dialer_shubbhvivah/common/widgets.dart';
import 'package:dialer_shubbhvivah/views/main/controllers/main_controller.dart';
import 'package:dialer_shubbhvivah/views/main/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class NewUsersView extends StatelessWidget {
  NewUsersView({super.key});
  final controller = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isNewUsersFetched.value
        ? controller.newUsersModel.data.isNotEmpty
            ? Column(
                children: [
                  for (int i = 0;
                      i < controller.newUsersModel.data.length;
                      i++) ...[
                    PhoneCard(
                        onTap: () {
                          var url = Uri.parse(
                              "tel:${controller.newUsersModel.data[i].phone}");
                          launchUrl(url);
                        },
                        name: controller.newUsersModel.data[i].name,
                        phoneNum: controller.newUsersModel.data[i].phone)
                  ]
                ],
              )
            : Text("NO DATA")
        : CommonWidgets.commonLoader); 
  }
}
