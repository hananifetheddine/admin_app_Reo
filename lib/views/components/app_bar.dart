import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

PreferredSizeWidget appBarComponent(String text) {
  return AppBar(
    leading: IconButton(
      onPressed: () => Get.back(),
      icon: Icon(
        Icons.arrow_back_ios_new_outlined,
        size: 13.sp,
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    title: Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
        fontFamily: "Montserrat7",
      ),
    ),
    centerTitle: true,
  );
}
