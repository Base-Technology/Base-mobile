import 'package:acy_ipay/Invest/earn_tab_view.dart';
import 'package:acy_ipay/widget/button_history.dart';
import 'package:acy_ipay/widget/button_switch_chain.dart';
import 'package:acy_ipay/widget/button_switch_wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

class investMain extends StatelessWidget {
  const investMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Container buyContainer(String topText, String botText, String iconString) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.42,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white38,
                      border: Border.all(color: Colors.grey.withOpacity(0.6))),
                  child: Stack(clipBehavior: Clip.none, children: [
                    Padding(
                        padding: EdgeInsets.all(3.5),
                        child: Container(
                            margin: EdgeInsets.only(left: 10, top: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    topText,
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    botText,
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ]))),
                    Positioned(
                        right: 5.0,
                        bottom: 0,
                        child: topText == 'Trade'
                            ? Padding(
                                padding: EdgeInsets.fromLTRB(8, 8, 5, 8),
                                child: SvgPicture.asset(iconString,
                                    width: 85, height: 85),
                              )
                            : SvgPicture.asset(
                                iconString,
                                width: 100,
                                height: 100,
                              ))
                  ])),
            ]),
      );
    }

    Widget topBar = Container(
        padding: EdgeInsets.only(top: 25, bottom: 15),
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 10),
              child: Text(
                'Earn',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                    color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SwitchChain(),
                SizedBox(
                  width: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: SwitchWallet(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: GoToHistory(),
                ),
              ],
            ),
          ],
        ));

    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          topBar,
          EarnTabView(),
        ],
      ),
    );
  }
}
