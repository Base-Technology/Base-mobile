import 'package:acy_ipay/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../widget/CustomText.dart';

class DisplayBox extends StatelessWidget {
  const DisplayBox({Key? key}) : super(key: key);

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
                "Display",
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -3),
            leading: SvgPicture.asset(
              themeProvider.isDarkMode
                  ? "assets/icon/icon_dark.svg"
                  : "assets/icon/icon_light.svg",
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              height: 20,
              width: 20,
            ),
            title: CustomText(
              "Theme",
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            onTap: () {},
            trailing: Switch.adaptive(
              value: themeProvider.isDarkMode,
              inactiveTrackColor: Color(0xF2DADFE2),
              activeTrackColor: Color(0x26FFC000),
              activeColor: Color(0xFFFFC000),
              inactiveThumbColor: Color(0xE682939D),
              onChanged: (value) {
                final provider =
                    Provider.of<ThemeProvider>(context, listen: false);
                provider.toggleTheme(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
