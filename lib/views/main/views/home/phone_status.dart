import 'package:dialer_shubbhvivah/common/colors.dart';
import 'package:dialer_shubbhvivah/views/main/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneStatus extends StatelessWidget {
  PhoneStatus({
    super.key,
    required this.containerTite,
  });
  final String containerTite;

  final controller = Get.put(MainController());

  List<String> statusTitle = [
    "Total Calls",
    "Total Duration",
    "Incoming",
    "Incoming Duration",
    "Outgoing",
    "Outgoing Duration",
    "Missed",
    "Rejected",
    "Never Attended",
    "Not Pickedup by Client",
    "Unique Clients",
    "Working Hours",
    "Connected Calls"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F3F8),
      body: Obx(
        () => SafeArea(
          child: !controller.isDialerApiFetched.value
              ? const Center(
                  child: CircularProgressIndicator(
                  color: CustomColors.pinkColor,
                ))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          width: double.infinity,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.r),
                                topRight: Radius.circular(12.r)),
                            color: Color(0xFF111723),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                containerTite,
                                style: GoogleFonts.poppins(
                                    fontSize: 20.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // height: 360.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.r),
                                  bottomRight: Radius.circular(12.r))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int i = 0; i < 13; i++) ...[
                                StatusRow(
                                  title: statusTitle[i],
                                  status: containerTite == "Today Phone Status"
                                      ? controller.todayPhoneStatus[i]
                                      : containerTite ==
                                              "Yesterday Phone Status"
                                          ? controller.yesterdayPhoneStatus[i]
                                          : controller.lastWeekPhoneStatus[i],
                                  //TODO
                                  index: i,
                                )
                              ]
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class StatusRow extends StatelessWidget {
  const StatusRow({
    super.key,
    required this.index,
    required this.title,
    required this.status,
  });
  final int index;
  final String title;
  final String status;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(fontSize: 14.sp),
              ),
              Text(
                status,
                style: GoogleFonts.poppins(fontSize: 14.sp),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          index == 12
              ? SizedBox()
              : Container(
                  height: 1.h,
                  color: Colors.grey,
                ),
        ],
      ),
    );
  }
}
