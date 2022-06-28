import 'package:acy_ipay/Homepage/Receive/receive_main.dart';
import 'package:flutter/material.dart';
import 'package:acy_ipay/Homepage/Send/send_main.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class SendReceiveButton extends StatelessWidget {
  final String title;
  const SendReceiveButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void sendSettings() => {
          pushNewScreenWithRouteSettings(
            context,
            settings: RouteSettings(name: '/send'),
            screen: SendMain(),
          )
        };
    void receiveSettings() => {
          pushNewScreenWithRouteSettings(
            context,
            settings: RouteSettings(name: '/receive'),
            screen: ReceiveMain(),
          )
        };

    return Container(
      height: 35,
      width: 165,
      margin: EdgeInsets.only(top: 20),
      child: TextButton(
        onPressed: title == "Send" ? sendSettings : receiveSettings,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.transparent)),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFC000)),
        ),
        child: Text(title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            )),
      ),
    );
  }
}
