import 'package:flutter/material.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

Widget animatedButton(RoundedLoadingButtonController controller,
    VoidCallback function, String title) {
  return RoundedLoadingButton(
    width:400,
    height: 57,
    
    controller: controller,
    onPressed: function,
    color: Colors.black87,
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        fontFamily: "Montserrat5",
        color: Colors.white,
      ),
    ),
  );
}
