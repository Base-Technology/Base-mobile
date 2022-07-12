import 'package:acy_ipay/widget/button_switch_wallet.dart';
import 'package:acy_ipay/Homepage/show_history.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import '../theme_provider.dart';
import 'CustomText.dart';

class TopBarHistory extends StatelessWidget {
  const TopBarHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                "History",
                fontSize: 22,
                fontWeight: FontWeight.w600
              ),
              Row(
                children: [
                  const SwitchWallet(),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    //padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: themeProvider.isDarkMode ? Colors.white : Colors.black)),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.transparent,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HistoryFilter()),
                          );
                        },
                        icon: SvgPicture.asset(
                          "assets/icon/icon_filter.svg",
                          width: 24,
                          height: 24,
                          color: themeProvider.isDarkMode ? const Color(0xFFBDBDBD) : Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
  }
}
