import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';

class SwitchWallet extends StatelessWidget {
  const SwitchWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      width: 140,
      height: 30,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          side: themeProvider.isDarkMode ? BorderSide(color: Colors.black) : null,
          shape:
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
              ),
          primary: themeProvider.isDarkMode ? Colors.grey.shade700 : Colors.white,
        ),
        child: Row(children: [
          Text(
            '0x90...2739',
            style: TextStyle(fontFamily: 'Karla', color: themeProvider.isDarkMode ? Colors.white : Colors.black),
          ),
          SizedBox(width: 10,),
          SvgPicture.asset(
            "assets/icon/icon_expand.svg",
            height: 20,
            width: 15,
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          )
        ]),
      ),
    );
  }
}
