import 'package:acy_ipay/Homepage/k_line.dart';
import 'package:acy_ipay/widget/CustomText.dart';
import 'package:acy_ipay/widget/topbar_simple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';

class TokenGraph extends StatelessWidget {
  final String tokenName;
  const TokenGraph({Key? key, required this.tokenName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Widget verification = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
              color: themeProvider.isDarkMode ? Color(0xFA1B1C1C) : Color(0XFFF0F4FF)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 5,),
                Icon(Icons.verified, color: Color(0xFA0095F0), size: 20),
                CustomText("Verified", fontSize: 18,),
                SizedBox(width: 5,)
              ]
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
                color: themeProvider.isDarkMode ? Color(0xFA1B1C1C) : Color(0XFFF0F4FF)
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 5),
                  SvgPicture.asset("assets/icon/icon_eth_chain.svg", height: 20, width: 20),
                  SizedBox(width: 5),
                  Text(
                    "0xdAC17D2ee...699D1ec7",
                    style: TextStyle(
                    color: themeProvider.isDarkMode ? Color(0xFFF4F4F4) : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                    fontFamily: 'Karla',
                      overflow: TextOverflow.ellipsis
                    ),
                  ),
                  SizedBox(width: 5,),
                ]
            ),
          ),
        ],
      ),
    );

    Widget tokenInfo = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText("\$2.23", fontWeight: FontWeight.w500),
                  Row(
                    children: [
                      CustomText("+4.12%",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        textColor: Colors.green
                      ),
                      Icon(Icons.arrow_drop_up_sharp, size: 20, color: Colors.green,)
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_balance_wallet_outlined, size: 20, color: Colors.black),
                      SizedBox(width: 5),
                      CustomText("0 BTC", fontSize: 16)
                    ],
                  ),
                  CustomText("\$0", fontSize: 16,)
                ],
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText("ATH", fontSize: 14),
                    CustomText("\$22.9", fontSize: 16),
                  ],
                )
              ),
              Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText("ATL", fontSize: 14),
                      CustomText("\$2.9", fontSize: 16),
                    ],
                  )
              ),
              Flexible(
                flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText("24H VOL", fontSize: 14),
                      CustomText("\$40.87M", fontSize: 16),
                    ],
                  )
              ),
              Flexible(
                flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText("MARKET CAP", fontSize: 14),
                      CustomText("\$316.54M", fontSize: 16),
                    ],
                  )
              ),
            ],
          )
        ],
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBarSimple(title: tokenName + " / USDT", isContact: false, isReferral: false),
            verification,
            tokenInfo,
            KLineGraph(),
            Text("here")
        ]),
      ),
    );
  }
}
