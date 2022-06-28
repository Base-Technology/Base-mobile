import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomText(
      this.data, {
      Key? key,
      this.textColor,
      this.fontSize,
      this.fontWeight,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: textColor ?? Colors.black,
        fontSize: fontSize ?? 20,
        fontWeight: fontWeight,
        decoration: TextDecoration.none,
        fontFamily: 'Karla',
      ),
    );
  }
}