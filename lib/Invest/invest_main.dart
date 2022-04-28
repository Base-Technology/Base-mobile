import 'package:flutter/cupertino.dart';
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
            mainAxisSize: MainAxisSize.max,
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
        padding: EdgeInsets.only(top: 25),
        color: Color(0xFFFBFBFB),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border:
                              Border.all(width: 1, color: Color(0xFFF36A3B))),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 10,
                        child: SvgPicture.asset(
                          'assets/icon/icon_zksync.svg',
                          width: 30,
                          height: 30,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      'Invest',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buyContainer('Buy', 'Crypto', 'assets/icon/icon_card2.svg'),
                    buyContainer(
                        'Trade', 'Crypto', 'assets/icon/icon_btceth.svg'),
                  ]),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Returns',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.grey.shade700),
                      ),
                      Text(
                        'APY',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400),
                      )
                    ]),
              )
            ]));

    return topBar;
  }
}
