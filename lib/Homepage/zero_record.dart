import 'package:acy_ipay/widget/topbar_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:acy_ipay/widget/CustomText.dart';
import 'package:provider/provider.dart';

import 'package:acy_ipay/theme_provider.dart';
class ZeroRecord extends StatelessWidget {
  const ZeroRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          const TopBarHistory(),
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icon/icon_data.svg",
                    width: 60,
                    height: 60,
                    color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: CustomText(
                      "Your activities will be shown here",
                      fontSize: 16,
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
