import 'package:acy_ipay/Homepage/Receive/receive_main.dart';
import 'package:acy_ipay/Homepage/bottom_nav_bar.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Base',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        fontFamily: 'Karla',
        primarySwatch: Colors.blue,
      ),
      home: bottomNavBar(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/earn': (context) => investMain(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/swap': (context) => SwapMain(),
        '/chat': (context) => ChatMain(),
        '/send': (context) => SendMain(),
        '/receive': (context) => ReceiveMain(),
      },
    );
  }
}
