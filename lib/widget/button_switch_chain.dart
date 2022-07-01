import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';

class SwitchChain extends StatelessWidget {
  const SwitchChain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
        margin: const EdgeInsets.only(left: 10, top: 10),
        height: 30,
        width: MediaQuery.of(context).size.width * 0.135,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: themeProvider.isDarkMode ? null : Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(50),
          color: themeProvider.isDarkMode ? Colors.grey.shade700 : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 10,
                child: SvgPicture.asset(
                  'assets/icon/icon_bsc_chain.svg',
                  width: 30,
                  height: 30,
                ),
              ),
              SvgPicture.asset(
                'assets/icon/icon_switch.svg',
                width: 28,
                height: 28,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
            ],
          ),
        ));
  }
}
