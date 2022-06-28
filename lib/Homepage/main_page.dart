import 'package:acy_ipay/Homepage/widget/SeeMoreIconButton.dart';
import 'package:acy_ipay/Homepage/widget/button_send_receive.dart';
import 'package:acy_ipay/widget/button_switch_chain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'tokens_data.dart';
import 'package:acy_ipay/Homepage/show_balance.dart';
import 'package:acy_ipay/Homepage/widget/MultiFunctionButton.dart';

class HomePage extends StatefulWidget {
  final ValueChanged<int>? onPush;
  const HomePage({Key? key, this.onPush}) : super(key: key);

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
        padding: EdgeInsets.only(top: 20,bottom: 10),
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SwitchChain(),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "\$0.00",
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icon/icon_notification.svg",
                    color: Colors.black,
                    width: 23,
                    height: 23,
                  ),
                  SizedBox(width: 20),
                  SvgPicture.asset(
                    "assets/icon/icon_search.svg",
                    color: Colors.black,
                    width: 23,
                    height: 23,
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ), //Color(0xFFFFC000)
          ],
        ));

    Widget swapPage = Container(
      margin: EdgeInsets.only(top: 5),
      height: 180,
      child: PageView(
        controller: PageController(viewportFraction: 0.9),
        scrollDirection: Axis.horizontal,
        onPageChanged: onPageChanged,
        pageSnapping: true,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
              color: Colors.transparent, //(0xE6292D2C),
            ),
            child: Wrap(
              spacing: 10,
              runSpacing: 15,
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                MultiFunctionButton(
                  text: "Buy",
                  iconPath: "assets/icon/icon_buy.svg",
                ),
                MultiFunctionButton(
                  text: "Swap",
                  iconPath: "assets/icon/icon_swap.svg",
                ),
                MultiFunctionButton(
                  text: "Earn",
                  iconPath: "assets/icon/icon_deposit.svg",
                ),
                MultiFunctionButton(
                  text: "Scan",
                  iconPath: "assets/icon/icon_scan.svg",
                ),
                MultiFunctionButton(
                  text: "Receive",
                  iconPath: "assets/icon/icon_down.svg",
                ),
                MultiFunctionButton(
                  text: "Send",
                  iconPath: "assets/icon/icon_up.svg",
                ),
                MultiFunctionButton(
                  text: "Referral",
                  iconPath: "assets/icon/icon_invite_friends.svg",
                ),
                MultiFunctionButton(
                  text: "More",
                  iconPath: "assets/icon/icon_more.svg",
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black, width: 1),
              color: Colors.white,
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
                ShowBalance(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SendReceiveButton(title: "Send"),
                    SendReceiveButton(title: "Receive"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget mainButton = Container(
      margin: const EdgeInsets.only(top: 5),
      height: 180,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15),
          color: Colors.white, //(0xE6292D2C),
        ),
        child: Wrap(
          spacing: 10,
          runSpacing: 15,
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            MultiFunctionButton(
              text: "Buy",
              iconPath: "assets/icon/icon_buy.svg",
            ),
            MultiFunctionButton(
              text: "Swap",
              iconPath: "assets/icon/icon_swap.svg",
            ),
            MultiFunctionButton(
              text: "Earn",
              iconPath: "assets/icon/icon_deposit.svg",
            ),
            MultiFunctionButton(
              text: "Scan",
              iconPath: "assets/icon/icon_scan.svg",
            ),
            MultiFunctionButton(
              text: "Receive",
              iconPath: "assets/icon/icon_down.svg",
            ),
            MultiFunctionButton(
              text: "Send",
              iconPath: "assets/icon/icon_up.svg",
            ),
            MultiFunctionButton(
              text: "Referral",
              iconPath: "assets/icon/icon_invite_friends.svg",
            ),
            MultiFunctionButton(
              text: "More",
              iconPath: "assets/icon/icon_more.svg",
            ),
          ],
        ),
      ),
    );

    return MaterialApp(
        home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            topBar,
            mainButton,
            Expanded(
                child: TokensData(
              changeIndex: curIndex,
            ),)
          ],
        ),
      )
    );
  }
}
