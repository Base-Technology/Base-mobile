import 'package:acy_ipay/Homepage/Receive/button_share_copy.dart';
import 'package:acy_ipay/widget/topbar_simple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../theme_provider.dart';
import '../../widget/CustomText.dart';

class ReceiveMain extends StatelessWidget {
  const ReceiveMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    Map blockchain = {"BEP-20": "BNB", "ERC-20": "ETH"};
    String address = "0x565cfgC936a060rtb454A6Ac2E4d9310D769eB289";
    String explorer = "Bscscan";
    double resWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TopBarSimple(title: "Receive", isContact: false, isReferral: false),
          Container(
            width: resWidth * 0.9,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      "${blockchain.keys.elementAt(0)}",
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: QrImage(
                    backgroundColor: themeProvider.isDarkMode ? Colors.white : Colors.transparent,
                    padding: EdgeInsets.all(15),
                    data: address,
                    version: QrVersions.auto,
                    size: 160.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        address,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Karla',
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.none,
                            color: themeProvider.isDarkMode ? Colors.white : Colors.black),
                      ),
                    )
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: SizedBox(
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          "View on $explorer",
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                        SvgPicture.asset(
                          "assets/icon/icon_arrow_up_right.svg",
                          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                          height: 12,
                          width: 12,
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    CustomText(
                      "Send only ${blockchain.keys.elementAt(0)} or ${blockchain.values.elementAt(0)} to this address.",
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    )
                  ],
                ),
                Row(
                  children: [
                    CustomText(
                        "Sending any other token may result in loss of your deposit",
                        fontSize: 12,
                        fontWeight: FontWeight.w300)
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShareCopyButton(text: "Share", address: address),
                    ShareCopyButton(text: "Copy", address: address),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
