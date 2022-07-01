import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';

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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Text(
      data,
      style: TextStyle(
        color: textColor ?? (themeProvider.isDarkMode ? Color(0xFFF4F4F4) : Colors.black),
        fontSize: fontSize ?? 20,
        fontWeight: fontWeight ?? FontWeight.w400,
        decoration: TextDecoration.none,
        fontFamily: 'Karla',
      ),
    );
  }
}
