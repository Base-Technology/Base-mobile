import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';
import '../theme_provider.dart';
import '../widget/CustomText.dart';

class ShowBalance extends StatefulWidget {
  const ShowBalance({Key? key}) : super(key: key);

  @override
  State<ShowBalance> createState() => _ShowBalanceState();
}

class _ShowBalanceState extends State<ShowBalance> {
  bool showBalance = true;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    double resWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          showBalance = !showBalance;
        });
      },
      child: SizedBox(
        width: resWidth * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            showBalance
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: CustomText(
                      "\$0.00",
                      fontSize: 30,
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        FaIcon(FontAwesomeIcons.ellipsis,
                            color: themeProvider.isDarkMode ? Colors.white : Colors.black, size: 55),
                        Padding(
                            padding: EdgeInsets.only(left: 2),
                            child: FaIcon(FontAwesomeIcons.ellipsis,
                                color: themeProvider.isDarkMode ? Colors.white : Colors.black, size: 55))
                      ]),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                  width: 28.0,
                  child: SvgPicture.asset(
                      showBalance
                          ? "assets/icon/icon_visibility_on.svg"
                          : "assets/icon/icon_visibility_off.svg",
                      height: 10,
                      width: 10,
                      color: Color(0xE6BDBDBD)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    showBalance
                        ? "Hide Total Net Worth"
                        : 'Show Total Net Worth',
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 10,
                        color: Color(0xE6BDBDBD),
                        decoration: TextDecoration.none),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
