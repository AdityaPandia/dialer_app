import 'package:dialer_shubbhvivah/common/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  CustomTextfield({
    super.key,
    required this.hintText,
    required this.hintStyle,
    this.controller,
    this.obscureText = false,
    this.decoration,
  });
  InputDecoration? decoration = const InputDecoration();
  String? hintText = "asdas";
  bool obscureText;
  final TextStyle hintStyle;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: CustomColors.lightGreyColor),
          borderRadius: BorderRadius.circular(12.r)),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        cursorColor: CustomColors.pinkColor,
        decoration: InputDecoration(
          hintStyle: hintStyle,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
