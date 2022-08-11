import 'package:acy_ipay/Homepage/Receive/receive_main.dart';
import 'package:acy_ipay/Homepage/Referral/referral_main.dart';
import 'package:acy_ipay/Homepage/bottom_nav_bar.dart';
import 'package:acy_ipay/Homepage/main_page.dart';
import 'package:acy_ipay/Register/register_main.dart';
import 'package:acy_ipay/Homepage/Send/send_main.dart';
import 'package:acy_ipay/Swap/swap_main.dart';
import 'package:acy_ipay/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:acy_ipay/Invest/invest_main.dart';
import 'package:acy_ipay/Chat/chat_main.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final boolTrue = false;
  final signUp = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Base',
          themeMode: ThemeMode.system,
          theme: CustomTheme.lightTheme,
          darkTheme: CustomTheme.darkTheme,
          home: signUp ? HomePage() : RegisterMain(),
          initialRoute: '/',
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            '/earn': (context) => investMain(),
            // When navigating to the "/second" route, build the SecondScreen widget.
            '/swap': (context) => SwapMain(),
            '/chat': (context) => ChatMain(),
            '/send': (context) => SendMain(),
            '/receive': (context) => ReceiveMain(),
            '/referral': (context) => ReferralMain(),
          },
        );
      });
}
