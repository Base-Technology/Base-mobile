import 'package:acy_ipay/Homepage/widget/SeeMoreIconButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'tokens_data.dart';
import 'package:acy_ipay/Homepage/show_balance.dart';
import 'package:acy_ipay/Homepage/widget/MultiFunctionButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curIndex = 0;

  void onPageChanged(int index) {
    setState(() {
      curIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget topBar = Container(
        padding: EdgeInsets.only(top: 25),
        color: Color(0xFF030203),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                      ),
                      child: SizedBox(
                        child: SvgPicture.asset(
                          'assets/icon/icon_base.svg',
                          color: const Color(0xFFFFC000),
                          width: 30,
                          height: 30,
                        ),
                      )),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SvgPicture.asset("assets/icon/icon_notification.svg",
                            color: Color(0xFFFFC000), width: 23,height: 23,),
                        SizedBox(width: 20),
                        SvgPicture.asset("assets/icon/icon_search.svg",
                          color: Color(0xFFFFC000), width: 23,height: 23,),
                        SizedBox(width: 15),
                      ]
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 180,
                child: PageView(
                  controller: PageController(viewportFraction: 0.9),
                  scrollDirection: Axis.horizontal,
                  onPageChanged: onPageChanged,
                  pageSnapping: true,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent, //(0xE6292D2C),
                      ),
                      child: Wrap(
                        spacing: 0,
                        runSpacing: 15,
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        children: [
                          MultiFunctionButton(
                              text: "Buy",
                              iconPath: "assets/icon/icon_buy.svg"),
                          MultiFunctionButton(
                              text: "Deposit",
                              iconPath: "assets/icon/icon_deposit.svg"),
                          MultiFunctionButton(
                              text: "Scan",
                              iconPath: "assets/icon/icon_scan.svg"),
                          MultiFunctionButton(
                              text: "Send",
                              iconPath: "assets/icon/icon_up.svg"),
                          MultiFunctionButton(
                              text: "Receive",
                              iconPath: "assets/icon/icon_down.svg"),
                          MultiFunctionButton(
                              text: "Swap",
                              iconPath: "assets/icon/icon_swap.svg"),
                          MultiFunctionButton(
                              text: "Transfer",
                              iconPath: "assets/icon/icon_send.svg"),
                          MultiFunctionButton(
                              text: "Referral",
                              iconPath: "assets/icon/icon_invite_friends.svg"),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xE6292D2C),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SeeMoreIconButton(
                                  titleText: "Wallet Details",
                                  widgetList: [Text('1'), Text("2"), Text("3")])
                            ],
                          ),
                          Center(child: ShowBalance()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TokensData(
                  changeIndex: curIndex,
                ),
            ]));

    return topBar;
  }
}
