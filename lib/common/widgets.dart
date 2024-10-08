import 'dart:io';

import 'package:dialer_shubbhvivah/common/colors.dart';
import 'package:dialer_shubbhvivah/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

abstract class CommonWidgets {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.transparent.withOpacity(0.3),
      textColor: Colors.white,
      fontSize: 16.sp,
    );
  }


  static List<BoxShadow> commonBoxShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.15), // Equivalent to #000000 15%
      offset: const Offset(0, 1), // Equivalent to x: 0, y: 1
      blurRadius: 20, // Equivalent to Blur 20
      spreadRadius: 0, // Equivalent to Spread 0
    ),
  ];

static Container exitDialogBox =Container(
      height: 120.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w), color: Colors.white),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Do you want to exit?",
              style: CustomTexts.poppins12,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: Text(
                      "Yes",
                      style: CustomTexts.poppins12,
                    )),
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "No",
                      style: CustomTexts.poppins12,
                    ))
              ],
            )
          ],
        ),
      ),
    );


   static  const SpinKitCircle commonLoader =  SpinKitCircle(
                            color: CustomColors.pinkColor,
                          );
}
