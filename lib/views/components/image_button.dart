import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;
  final VoidCallback onPressed;
  final String text;

  const CustomImageContainer({
    super.key,
    required this.imagePath,
    required this.height,
    required this.width,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(text, style: const TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
