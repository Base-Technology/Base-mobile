import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';
import '../widget/CustomText.dart';

class SecurityBox extends StatefulWidget {
  const SecurityBox({Key? key}) : super(key: key);

  @override
  State<SecurityBox> createState() => _SecurityBoxState();
}

class _SecurityBoxState extends State<SecurityBox> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode ? Color(0xF20F0F0F) : Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 16,
              ),
              CustomText(
                "Security",
                  fontSize: 18,
              ),
            ],
          ),
          SizedBox(height: 5,),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_password.svg",
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              height: 20,
              width: 20,
            ),
            title: CustomText(
              "Change PIN",
              fontSize: 16,
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              "assets/icon/icon_fingerprint.svg",
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              height: 20,
              width: 20,
            ),
            title: CustomText(
              "Fingerprint",
              fontSize: 16,
            ),
            onTap: () {},
            trailing: Switch(
              value: isSwitched,
              inactiveTrackColor: themeProvider.isDarkMode ? Color(0x26FFC000) : Color(0xF2DADFE2),
              activeTrackColor: themeProvider.isDarkMode ? Color(0x26FFC000) : Color(0xF2DADFE2),
              activeColor: themeProvider.isDarkMode ? Color(0xFFFFC000) : Color(0xE682939D),
              inactiveThumbColor: themeProvider.isDarkMode ? Color(0xFFFFC000) : Color(0xE682939D),
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
