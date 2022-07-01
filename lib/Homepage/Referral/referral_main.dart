import 'package:acy_ipay/Homepage/Referral/referral_volume.dart';
import 'package:acy_ipay/widget/CustomText.dart';
import 'package:acy_ipay/widget/topbar_simple.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:acy_ipay/theme_provider.dart';

class ReferralMain extends StatelessWidget {
  const ReferralMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Widget totalRewards = Container(
      width: MediaQuery.of(context).size.width * 0.95,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Color(0xE61B1D1C), borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              "Total referral rewards",
              textColor: Color(0xFF7F8180),
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
            SizedBox(height: 5),
            CustomText(
              "0 USDT",
              textColor: Color(0xFFCACACA),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );

    Widget constantText = Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: CustomText(
          "Copy the Referral Codes below and share with your friends & start earning",
          fontSize: 14,
          textColor: themeProvider.isDarkMode ? Color(0xF2979797) : Colors.black,
          fontWeight: FontWeight.w400,
        ));

    Widget constantBottomText = Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: CustomText(
          "\$2000 more to unlock the next tier reward",
          fontSize: 14,
          textColor: themeProvider.isDarkMode ? Color(0xF2979797) : Colors.black,
          fontWeight: FontWeight.w400,
        ));

    return Scaffold(
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopBarSimple(title: "Referral", isContact: false, isReferral: true),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: totalRewards,
            ),
            constantText,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ReferralVolume(),
            ),
            constantBottomText
          ],
        ));
  }
}
