import 'package:acy_ipay/Homepage/Receive/receive_main.dart';
import 'package:acy_ipay/Homepage/Referral/referral_main.dart';
import 'package:acy_ipay/Homepage/Send/send_main.dart';
import 'package:acy_ipay/Invest/invest_main.dart';
import 'package:acy_ipay/Homepage/Buy/buy_main.dart';
import 'package:acy_ipay/Swap/swap_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

enum pageNum { _, Buy, Swap, Deposit, Scan, Send, Transfer, Referral, More }

class MultiFunctionButton extends StatelessWidget {
  final String text;
  final String iconPath;
  MultiFunctionButton({Key? key, required this.text, required this.iconPath})
      : super(key: key);

  //@override
  //State<MultiFunctionButton> createState() => _MultiFunctionButtonState();
//}

//class _MultiFunctionButtonState extends State<MultiFunctionButton> {
  int buttonGrid = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 80,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(100)),
              child: TextButton(
                onPressed: () {
                  /*var res = EnumToString.fromString(pageNum.values, text);
                  int? p = res?.index;
                  onButtonTap(p!);*/
                  if (text == 'Swap') {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: RouteSettings(name: '/swap'),
                      screen: SwapMain(),
                    );
                  } else if (text == 'Send') {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: RouteSettings(name: '/send'),
                      screen: SendMain(),
                    );
                  } else if (text == 'Receive') {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: RouteSettings(name: '/receive'),
                      screen: ReceiveMain(),
                    );
                  } else if (text == 'Buy') {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: RouteSettings(name: '/buy'),
                      screen: BuyMain(),
                    );
                  } else if (text == 'Referral') {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: RouteSettings(name: '/referral'),
                      screen: ReferralMain(),
                    );
                  }else {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: RouteSettings(name: '/earn'),
                      screen: investMain(),
                    );
                  }
                  //pushNewScreen(context, screen: ChatMain());
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(10.0),
                  primary: Colors.black,
                  backgroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    SvgPicture.asset(
                      iconPath,
                      width: 25,
                      height: 25,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
