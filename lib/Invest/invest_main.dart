import 'package:acy_ipay/Invest/earn_tab_view.dart';
import 'package:acy_ipay/widget/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import '../widget/CustomText.dart';
class investMain extends StatelessWidget {
  const investMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Container buyContainer(String topText, String botText, String iconString) {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.42,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white38,
                      border: Border.all(color: Colors.grey.withOpacity(0.6))),
                  child: Stack(clipBehavior: Clip.none, children: [
                    Padding(
                        padding: const EdgeInsets.all(3.5),
                        child: Container(
                            margin: const EdgeInsets.only(left: 10, top: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    topText,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomText(
                                    botText,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
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

    return Column(
        children: [
          TopBar(title: "Invest"),
          Expanded(child: EarnTabView()),
        ],
    );
  }
}
