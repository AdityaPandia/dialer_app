import 'package:dialer_shubbhvivah/common/widgets.dart';
import 'package:dialer_shubbhvivah/views/main/controllers/main_controller.dart';
import 'package:dialer_shubbhvivah/views/main/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class NewUploadUsersView extends StatelessWidget {
   NewUploadUsersView({super.key});
 final controller = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
  return Obx(() => controller.isNewUploadUsersFetched.value
        ? controller.newUploadUsersModel.data.isNotEmpty
            ? Column(
                children: [
                  for (int i = 0;
                      i < controller.newUploadUsersModel.data.length;
                      i++) ...[
                    NewUserContainer(
                        onTap: () {
                          var url = Uri.parse(
                              "tel:${controller.newUploadUsersModel.data[i].phone}");
                          launchUrl(url);
                        },
                        name: controller.newUploadUsersModel.data[i].name,
                        phoneNum: controller.newUploadUsersModel.data[i].phone)
                  ]
                ],
              )
            : Text("NO DATA")
        : CommonWidgets.commonLoader); 
  }
}