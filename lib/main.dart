import 'package:acy_ipay/Homepage/Receive/receive_main.dart';
import 'package:acy_ipay/Homepage/Buy/buy_main.dart';
import 'package:acy_ipay/Homepage/bottom_nav_bar.dart';
import 'package:acy_ipay/Register/register_main.dart';
import 'package:acy_ipay/Swap/swap_main.dart';
import 'package:flutter/material.dart';
import 'package:acy_ipay/Invest/invest_main.dart';

import 'package:acy_ipay/Chat/chat_main.dart';

import 'Homepage/Send/send_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final boolTrue = false;
  final signUp = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Base',
      theme: ThemeData(
          fontFamily: 'Karla',
          backgroundColor: Colors.white
      ),
      home: signUp ? bottomNavBar() : RegisterMain(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/earn': (context) => investMain(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/swap': (context) => SwapMain(),
        '/chat': (context) => ChatMain(),
        '/send': (context) => SendMain(),
        '/receive': (context) => ReceiveMain(),
        '/buy': (context) => BuyMain(),
      },
    );
  }
}
