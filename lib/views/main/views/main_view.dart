import 'package:dialer_shubbhvivah/common/colors.dart';
import 'package:dialer_shubbhvivah/common/text_styles.dart';
import 'package:dialer_shubbhvivah/common/widgets.dart';
import 'package:dialer_shubbhvivah/views/login/views/login_view.dart';
import 'package:dialer_shubbhvivah/views/main/controllers/main_controller.dart';
import 'package:dialer_shubbhvivah/views/main/views/tab_views/new_users_view.dart';
import 'package:dialer_shubbhvivah/views/main/views/tab_views/new_upload_users_view.dart';
import 'package:dialer_shubbhvivah/views/main/views/tab_views/today_new_users_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MainView extends StatelessWidget {
  MainView({super.key});
  final controller = Get.put(MainController());
  List<Widget> tabList = [
    NewUsersView(),
    TodayNewUsersView(),
    NewUploadUsersView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FE),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ZoomTapAnimation(
                        onTap: () {
                          Get.to(LoginView());
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
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextField(
                  decoration:
                      InputDecoration(hintText: "Search User - by status"),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < controller.tabTitles.length; i++) ...[
                      ZoomTapAnimation(
                        onTap: () {
                          controller.selectedTabIndex.value = i;
                        },
                        child: Obx(
                          () => TabBarButton(
                            isSelected: controller.selectedTabIndex.value == i,
                            title: controller.tabTitles[i],
                          ),
                        ),
                      )
                    ],
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Obx(() => tabList[controller.selectedTabIndex.value]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewUserContainer extends StatelessWidget {
  NewUserContainer({
    super.key,
    required this.name,
    required this.phoneNum,
    this.onTap,
  });
  final String name;
  final String phoneNum;
  dynamic Function()? onTap;
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
                Text(name, style: CustomTexts.poppins16),
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
        color:
            isSelected ? CustomColors.pinkColor : CustomColors.lightGreyColor,
        borderRadius: BorderRadius.circular(12.r),
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
