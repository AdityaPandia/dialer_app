import 'package:dialer_shubbhvivah/common/colors.dart';
import 'package:dialer_shubbhvivah/common/widgets.dart';
import 'package:dialer_shubbhvivah/views/login/models/member_model.dart';
import 'package:dialer_shubbhvivah/views/main/controllers/main_controller.dart';
import 'package:dialer_shubbhvivah/views/main/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ClientsView extends StatelessWidget {
  ClientsView({super.key, required this.memberStatus});
  final int memberStatus;
  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => !controller.isAllProfilesFetched.value
              ? const SizedBox()
              : TextField(
                  controller: controller.phoneSearchController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^[\d+]+$')),
                  ],
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search By Number',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
        ),
        SizedBox(
          height: 5,
        ),
        Obx(
          () => !controller.isAllProfilesFetched.value
              ? const SizedBox()
              : TextField(
                  controller: controller.nameSearchController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search By Name',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              CustomColors.pinkColor,
              Color.fromARGB(255, 210, 161, 190)
            ])),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(
                () => !controller.isAllProfilesFetched.value
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : memberStatus < 5
                        ? Column(
                            children: [
                              for (int i = 0;
                                  i < controller.filteredUsers.length;
                                  i++) ...[
                                controller.filteredUsers[i].memberStatus ==
                                        memberStatus
                                    ? PhoneCard(
                                        onTap: () {
                                          var url = Uri.parse(
                                              "tel:${controller.filteredUsers[i].phone}");
                                          launchUrl(url);
                                        },
                                        name:
                                            "${controller.filteredUsers[i].firstName} ${controller.filteredUsers[i].lastName}",
                                        phoneNum:
                                            "${controller.filteredUsers[i].phone}")
                                    : SizedBox(
                                        width: double.infinity,
                                      ),
                              ],
                            ],
                          )
                        : memberStatus == 6
                            ? controller.isNewUsersFetched.value
                                ? controller.newUsersModel.data.isNotEmpty
                                    ? Column(
                                        children: [
                                          for (int i = 0;
                                              i <
                                                  controller.newUsersModel.data
                                                      .length;
                                              i++) ...[
                                            PhoneCard(
                                                onTap: () {
                                                  var url = Uri.parse(
                                                      "tel:${controller.newUsersModel.data[i].phone}");
                                                  launchUrl(url);
                                                },
                                                name: controller
                                                    .newUsersModel.data[i].name,
                                                phoneNum: controller
                                                    .newUsersModel
                                                    .data[i]
                                                    .phone)
                                          ]
                                        ],
                                      )
                                    : Text("NO DATA")
                                : CommonWidgets.commonLoader
                            : memberStatus == 5
                                ? Column(
                                    children: [
                                      for (int i = 0;
                                          i < controller.filteredUsers.length;
                                          i++) ...[
                                        PhoneCard(
                                            onTap: () {
                                              var url = Uri.parse(
                                                  "tel:${controller.filteredUsers[i].phone}");
                                              launchUrl(url);
                                            },
                                            name:
                                                "${controller.filteredUsers[i].firstName} ${controller.filteredUsers[i].lastName}",
                                            phoneNum:
                                                "${controller.filteredUsers[i].phone}"),
                                      ]
                                    ],
                                  )
                                : memberStatus == 7
                                    ? Column(
                                        children: [
                                          for (int i = 0;
                                              i <
                                                  controller
                                                      .filteredUsers.length;
                                              i++) ...[
                                            controller.filteredUsers[i]
                                                            .nextFollowUp !=
                                                        null &&
                                                    controller.filteredUsers[i]
                                                            .nextFollowUp!
                                                            .toLocal()
                                                            .year ==
                                                        DateTime.now().year &&
                                                    controller.filteredUsers[i]
                                                            .nextFollowUp!
                                                            .toLocal()
                                                            .month ==
                                                        DateTime.now().month &&
                                                    controller.filteredUsers[i]
                                                            .nextFollowUp!
                                                            .toLocal()
                                                            .day ==
                                                        DateTime.now().day
                                                ? PhoneCard(
                                                    onTap: () {
                                                      var url = Uri.parse(
                                                          "tel:${controller.filteredUsers[i].phone}");
                                                      launchUrl(url);
                                                    },
                                                    name:
                                                        "${controller.filteredUsers[i].firstName} ${controller.filteredUsers[i].lastName}",
                                                    phoneNum:
                                                        "${controller.filteredUsers[i].phone}")
                                                : const SizedBox(),
                                          ]
                                        ],
                                      )
                                    : const SizedBox(
                                        width: double.infinity,
                                      ),
              ),
            )),
      ],
    );
  }
}
