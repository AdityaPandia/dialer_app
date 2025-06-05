import 'dart:convert';

import 'package:dialer_shubbhvivah/common/colors.dart';
import 'package:dialer_shubbhvivah/common/text_styles.dart';
import 'package:dialer_shubbhvivah/common/widgets.dart';
import 'package:dialer_shubbhvivah/views/login/controllers/login_controller.dart';
import 'package:dialer_shubbhvivah/views/main/views/main_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final controller = Get.put(LoginController());
  RxBool isLoading = false.obs;
  RxBool isObscure = true.obs;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FE),
      body: Column(
        children: [
          SizedBox(height: 60.h),
          Text(
            "Admin Dialer App for",
            style:
                CustomTexts.poppins20.copyWith(color: CustomColors.pinkColor),
          ),
          Image.asset(
            'assets/images/logo_cropped.png',

            // height: 200,
            width: 250,
          ),

          Center(
            child: Text(
              "Log in to your account",
              style: TextStyle(
                color: CustomColors.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 20),

          const SizedBox(height: 20 * 3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  filled: true,
                  // fillColor: CustomColors.blackColor,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  isDense: true,
                  label: Text(
                    "Enter email/phone number",
                    style: const TextStyle(
                      color: CustomColors.lightGreyColor,
                      fontSize: 15,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                style: const TextStyle(
                  color: CustomColors.blackColor,
                  fontSize: 16,
                )),
          ),

          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => TextField(
                  controller: controller.passController,
                  obscureText: isObscure.value,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        isObscure.value = !isObscure.value;
                      },
                      child: Icon(
                        isObscure.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: CustomColors.blackColor,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    isDense: true,
                    label: Text(
                      "Enter password",
                      style: TextStyle(
                        color: CustomColors.lightGreyColor,
                        fontSize: 15,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  style: const TextStyle(
                    color: CustomColors.blackColor,
                    fontSize: 16,
                  )),
            ),
          ),

          const SizedBox(height: 10),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SizedBox(
                width: 1.sw,
                child: Text(
                  "Forgot Password?",
                  style: const TextStyle(
                    color: CustomColors.blackColor,
                    fontSize: 13,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 30,
          ),

          Center(
            child: GestureDetector(
              onTap: () async {
                if (!isLoading.value) {
                  isLoading.value = true;
                  await controller.login() ? Get.offAll(MainView()) : null;
                  isLoading.value = false;
                }
              },
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 2.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          CustomColors.pinkColor,
                          CustomColors.purpleColor
                        ])),
                child: Obx(
                  () => Center(
                      child: isLoading.value
                          ? CircularProgressIndicator()
                          : Text(
                              "Login",
                              style: CustomTexts.poppins16
                                  .copyWith(color: Colors.white),
                            )),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          // Already have an account
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Dont have an account?",
                style: const TextStyle(
                  color: CustomColors.blackColor,
                  fontSize: 15,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(' Signup free',
                    style: TextStyle(
                      color: CustomColors.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
