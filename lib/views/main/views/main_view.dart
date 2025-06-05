import 'package:dialer_shubbhvivah/common/colors.dart';
import 'package:dialer_shubbhvivah/common/text_styles.dart';
import 'package:dialer_shubbhvivah/common/widgets.dart';
import 'package:dialer_shubbhvivah/views/login/views/login_view.dart';
import 'package:dialer_shubbhvivah/views/main/controllers/main_controller.dart';
import 'package:dialer_shubbhvivah/views/main/views/home/phone_status.dart';
import 'package:dialer_shubbhvivah/views/main/views/tab_views/clients_view.dart';
import 'package:dialer_shubbhvivah/views/main/views/tab_views/new_users_view.dart';
import 'package:dialer_shubbhvivah/views/main/views/tab_views/positive_clients_view.dart';
import 'package:dialer_shubbhvivah/views/main/views/tab_views/total_followup_clients_view.dart';
import 'package:dialer_shubbhvivah/views/main/views/widgets/pagination_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MainView extends StatelessWidget {
  MainView({super.key});
  final controller = Get.put(MainController());
  List<Widget> tabList = [
    for (int i = 0; i < 8; i++) ...[
      ClientsView(memberStatus: i),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
         controller.dialerApiCall();
        controller.dialerClientApiCall();
        controller.fetchNewUsers();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ZoomTapAnimation(
                  onTap: () {
                    Get.offAll(LoginView());
                  },
                  child: Text(
                    "Logout",
                    style: CustomTexts.poppins14,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Icon(
                  Icons.logout,
                  color: CustomColors.blackColor,
                  size: 14.sp,
                ),
              ],
            ),
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: CustomColors.pinkColor,
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                CircleAvatar(
                  radius: 50.r,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.phone,
                    color: CustomColors.pinkColor,
                    size: 50.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Shubh Vivah Dialer",
                  style: CustomTexts.poppins20.copyWith(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SidebarTile(
                      label: "Today Phone Status",
                      onTap: () {
                        Get.to(
                            PhoneStatus(containerTite: "Today Phone Status"));
                      },
                    ),
                    SizedBox(height: 10.h),
                    _SidebarTile(
                      label: "Yesterday Phone Status",
                      onTap: () {
                        Get.to(PhoneStatus(
                            containerTite: "Yesterday Phone Status"));
                      },
                    ),
                    SizedBox(height: 10.h),
                    _SidebarTile(
                      label: "Last Week Phone Status",
                      onTap: () {
                        Get.to(PhoneStatus(
                            containerTite: "Last Week Phone Status"));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 300.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: _SidebarTile(
                    label: "Logout",
                    onTap: () {
                      Get.offAll(LoginView());
                    },
                    icon: Icons.logout,
                    textColor: Colors.black.withOpacity(0.6),
                    iconColor: Colors.black.withOpacity(0.6),
                  ),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Color(0xFFF5F6FE),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child:
                  // ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // TextField(
                  //   decoration:
                  //       InputDecoration(hintText: "Search User - by status"),
                  // ),
                  CircleAvatar(
                    radius: 50.r,
                    backgroundColor: CustomColors.pinkColor,
                    child: Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 50.sp,
                    ),
                  ),
                  Image.asset(
                    'assets/images/logo_cropped.png',

                    // height: 200,
                    width: 250,
                  ),
                  Text(
                    "Dialer App",
                    style: CustomTexts.poppins20
                        .copyWith(color: CustomColors.pinkColor),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    child: Wrap(
                      runSpacing: 10.w,
                      spacing: 10.w,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0;
                            i < controller.tabTitles.length;
                            i++) ...[
                          ZoomTapAnimation(
                            onTap: () {
                              controller.selectedTabIndex.value = i;
                            },
                            child: Obx(
                              () => TabBarButton(
                                isSelected:
                                    controller.selectedTabIndex.value == i,
                                title: controller.tabTitles[i],
                              ),
                            ),
                          )
                        ],
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 30.h,
                  ),
                  Obx(() => tabList[controller.selectedTabIndex.value]),
                  SizedBox(
                    height: 20.h,
                  ),
                  // Obx(
                  //   () => controller.isAllProfilesFetched.value
                  //       ? ViewMoreButton(onPressed: () {
                  //           controller.fetchFrom = controller.fetchTill;
                  //           controller.fetchTill = controller.fetchTill + 10;
                  //           controller.fetchAllProfiles(false);
                  //         })
                  //       : SizedBox(),
                  // ),
                  SizedBox(
                    height: 30.h,
                  ),
                  // Container(
                  //     decoration: BoxDecoration(
                  //         gradient: LinearGradient(colors: [
                  //       CustomColors.pinkColor,
                  //       Color.fromARGB(255, 210, 161, 190)
                  //     ])),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(16.0),
                  //       child:
                  //           Obx(() => tabList[controller.selectedTabIndex.value]),
                  //     )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PhoneCard extends StatelessWidget {
  PhoneCard({
    super.key,
    required this.name,
    required this.phoneNum,
    this.onTap,
  });
  final String name;
  final String phoneNum;
  dynamic Function()? onTap;
  String truncate(String text) =>
      text.length > 17 ? '${text.substring(0, 17)}...' : text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: Color.fromARGB(255, 210, 161, 190),
              size: 58.sp,
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(truncate(name), style: CustomTexts.poppins16),
                Text(
                  phoneNum,
                  style: CustomTexts.poppins16
                      .copyWith(color: Color.fromARGB(255, 86, 84, 84)),
                ),
              ],
            ),
            Spacer(),
            ZoomTapAnimation(
              onTap: onTap,
              child: Icon(
                Icons.phone,
                color: CustomColors.pinkColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TabBarButton extends StatelessWidget {
  TabBarButton({
    required this.isSelected,
    super.key,
    required this.title,
  });
  bool isSelected;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 100.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            isSelected ? CustomColors.pinkColor : CustomColors.lightGreyColor,
            isSelected
                ? Color.fromARGB(255, 210, 161, 190)
                : CustomColors.lightGreyColor
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // color:
        //     isSelected ? CustomColors.pinkColor : CustomColors.lightGreyColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SizedBox(
            width: 100.w,
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: CustomTexts.poppins14.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _SidebarTile({
  required String label,
  required VoidCallback onTap,
  IconData? icon,
  Color? textColor,
  Color? iconColor,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 8.w),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        splashColor: Colors.white24,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              if (icon != null)
                Icon(icon, color: iconColor ?? Colors.white, size: 20),
              if (icon != null) SizedBox(width: 8),
              Text(
                label,
                style: CustomTexts.poppins16.copyWith(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
